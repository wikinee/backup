Sublime3 支持中文输入
------
[原文](http://www.lanmeng.org/2015/05/linux-sublimetext-chinese.html)

Sublime Text是一个功能强大的跨平台代码编辑器，但是在Linux系统下一直无法输入中文。由于目前已把Ubuntu当作主力操作系统使用，平时使用Sublime Text处理文本时经常需要输入中文，所以整理一下Sublime Text打中文补丁的过程。

### 背景环境

- 操作系统：Ubuntu 15.04
- Sublime Text版本：3

`（注：Ubuntu 14.04 LTS同样有效）`

### 安装Fcitx

Ubuntu 15.04默认输入法既为Fcitx，如果你的Ubuntu版本低于15.04可能需要安装Fcitx，安装方法可以从网络搜索。

`（注：Sogou PinYin for Linux同样有效）`

### 安装补丁

新建文件sub-fcitx.c，建议放在Sublime Text的所在目录下，将下面的代码复制进去。

 ```C
/*
sublime-fcitx.c
Use LD_PRELOAD to interpose some function to fix sublime input method support for linux.
By Cjacker Huang


gcc -shared -o libsublime-imfix.so sublime-imfix.c `pkg-config --libs --cflags gtk+-2.0` -fPIC
LD_PRELOAD=./libsublime-imfix.so subl
*/
#include <gtk/gtk.h>
#include <gdk/gdkx.h>
typedef GdkSegment GdkRegionBox;


struct _GdkRegion
{
  long size;
  long numRects;
  GdkRegionBox *rects;
  GdkRegionBox extents;
};


GtkIMContext *local_context;


void
gdk_region_get_clipbox (const GdkRegion *region,
            GdkRectangle    *rectangle)
{
  g_return_if_fail (region != NULL);
  g_return_if_fail (rectangle != NULL);


  rectangle->x = region->extents.x1;
  rectangle->y = region->extents.y1;
  rectangle->width = region->extents.x2 - region->extents.x1;
  rectangle->height = region->extents.y2 - region->extents.y1;
  GdkRectangle rect;
  rect.x = rectangle->x;
  rect.y = rectangle->y;
  rect.width = 0;
  rect.height = rectangle->height;
  //The caret width is 2;
  //Maybe sometimes we will make a mistake, but for most of the time, it should be the caret.
  if(rectangle->width == 2 && GTK_IS_IM_CONTEXT(local_context)) {
        gtk_im_context_set_cursor_location(local_context, rectangle);
  }
}


//this is needed, for example, if you input something in file dialog and return back the edit area
//context will lost, so here we set it again.


static GdkFilterReturn event_filter (GdkXEvent *xevent, GdkEvent *event, gpointer im_context)
{
    XEvent *xev = (XEvent *)xevent;
    if(xev->type == KeyRelease && GTK_IS_IM_CONTEXT(im_context)) {
      GdkWindow * win = g_object_get_data(G_OBJECT(im_context),"window");
      if(GDK_IS_WINDOW(win))
        gtk_im_context_set_client_window(im_context, win);
    }
    return GDK_FILTER_CONTINUE;
}


void gtk_im_context_set_client_window (GtkIMContext *context,
          GdkWindow    *window)
{
  GtkIMContextClass *klass;
  g_return_if_fail (GTK_IS_IM_CONTEXT (context));
  klass = GTK_IM_CONTEXT_GET_CLASS (context);
  if (klass->set_client_window)
    klass->set_client_window (context, window);


  if(!GDK_IS_WINDOW (window))
    return;
  g_object_set_data(G_OBJECT(context),"window",window);
  int width = gdk_window_get_width(window);
  int height = gdk_window_get_height(window);
  if(width != 0 && height !=0) {
    gtk_im_context_focus_in(context);
    local_context = context;
  }
  gdk_window_add_filter (window, event_filter, context);
}
```

### 安装编译环境

sudo apt-get install build-essential libgtk2.0-dev

### 编译文件

切换到sub-fcitx.c，所在目录，编译生成so文件

gcc -shared -o libsublime-imfix.so sub-fcitx.c \`pkg-config --libs --cflags gtk+-2.0\` -fPIC

目录下会多一个libsublime-imfix.so文件

### 添加启动脚本

修改目录下的sublime_text.desktop文件，内容如下(注: 路径改为实际路径)

```text
[Desktop Entry]
Version=1.0
Type=Application
Name=Sublime Text
GenericName=Text Editor
Comment=Sophisticated text editor for code, markup and prose
Exec=bash -c "LD_PRELOAD=/opt/sublime_text/libsublime-imfix.so exec /opt/sublime_text/sublime_text %F"
Terminal=false
MimeType=text/plain;
Icon=/opt/sublime_text/Icon/128x128/sublime-text.png
Categories=TextEditor;Development;IDE;
StartupNotify=true
Actions=Window;Document;

[Desktop Action Window]
Name=New Window
Exec=bash -c "LD_PRELOAD=/opt/sublime_text_3/libsublime-imfix.so exec /opt/sublime_text/sublime_text -n"
OnlyShowIn=Unity;

[Desktop Action Document]
Name=New File
Exec=bash -c "LD_PRELOAD=/opt/sublime_text/libsublime-imfix.so exec /opt/sublime_text/sublime_text --command new_file"
OnlyShowIn=Unity;
```

最后，为sublime_text.desktop文件添加执行权限

chmod +x sublime_text.desktop

以后双击 sublime_text.desktop 就能支持Sublime Text了，运行后也可以锁定到启动器上以方便启动。
