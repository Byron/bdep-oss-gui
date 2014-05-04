This assembly contains all open-source dependencies that come with graphical user interface.

Besides that, it is very similar to [bdep-oss](https://github.com/Byron/bdep-oss) and meant to be an optional add-on.

Motivation to doing this is to speed up continous integration, as installation on boxes that will never see a GUI is much faster when there are no big dependencies.

Especially QT also runs in non-gui mode with QtCore and a few other libraries, but providing those separately would be easy enough to do it when required.
