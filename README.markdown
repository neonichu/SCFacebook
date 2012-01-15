# OAuth keylogger demonstration #

Adding UIWebViews for OAuth logins in mobile apps adds zero security. This
thing demonstrates it by stealing your Facebook credentials. The problem
ought to be widely known, but apparently we need a simple demonstration
to end it. Do not use this to actually steal other people's credentials,
mmmmkay?

I used [SCFacebook] (https://github.com/lucascorrea/SCFacebook) as base
just because it ships with a simple FB example app. You can do the same
with other similar approaches like the Twitter or Flattr APIs.

Minor technical note: by default FB Connect opens the login dialog in
Mobile Safari. As the comments in the source say, this is *not* a
security measure, but a matter of using the cookies from it. With a
slight modification, the in-app login is used by default and that's what
this example does.


### Original license of SCFacebook ###

SCFacebook is licensed under the MIT License:

Copyright (c) 2011 Lucas Correa (http://www.lucascorrea.com/)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
