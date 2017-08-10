/* 

    Hack for HTML5 bug.
    -------------------
    buffer_exists doesn't work on HTML5 module.
    It's a known issue and fixed. But not released at the
    time of releasing this.
    
    http://bugs.yoyogames.com/view.php?id=26266

    Copyright 2017, Cem Baspinar
    Reuse permitted under the MIT license.
    
*/

if (os_browser != browser_not_a_browser) return 1;
return buffer_exists(argument0);
