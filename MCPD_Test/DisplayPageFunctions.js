/**
 * @fileoverview dragscroll - scroll area by dragging
 * @version 0.0.8
 * 
 * @license MIT, see http://github.com/asvd/dragscroll
 * @copyright 2015 asvd <heliosframework@gmail.com> 
 */

//Zoom Scroll Function
(function (root, factory) {
    if (typeof define === 'function' && define.amd) {
        define(['exports'], factory);
    } else if (typeof exports !== 'undefined') {
        factory(exports);
    } else {
        factory((root.dragscroll = {}));
    }
}(this, function (exports) {
    var _window = window;
    var _document = document;
    var mousemove = 'mousemove';
    var mouseup = 'mouseup';
    var mousedown = 'mousedown';
    var EventListener = 'EventListener';
    var addEventListener = 'add' + EventListener;
    var removeEventListener = 'remove' + EventListener;
    var newScrollX, newScrollY;

    var dragged = [];
    var reset = function (i, el) {
        for (i = 0; i < dragged.length;) {
            el = dragged[i++];
            el = el.container || el;
            el[removeEventListener](mousedown, el.md, 0);
            _window[removeEventListener](mouseup, el.mu, 0);
            _window[removeEventListener](mousemove, el.mm, 0);
        }

        // cloning into array since HTMLCollection is updated dynamically
        dragged = [].slice.call(_document.getElementsByClassName('dragscroll'));
        for (i = 0; i < dragged.length;) {
            (function (el, lastClientX, lastClientY, pushed, scroller, cont) {
                (cont = el.container || el)[addEventListener](
                    mousedown,
                    cont.md = function (e) {
                        if (!el.hasAttribute('nochilddrag') ||
                            _document.elementFromPoint(
                                e.pageX, e.pageY
                            ) == cont
                        ) {
                            pushed = 1;
                            lastClientX = e.clientX;
                            lastClientY = e.clientY;

                            e.preventDefault();
                        }
                    }, 0
                );

                _window[addEventListener](
                    mouseup, cont.mu = function () { pushed = 0; }, 0
                );

                _window[addEventListener](
                    mousemove,
                    cont.mm = function (e) {
                        if (pushed) {
                            (scroller = el.scroller || el).scrollLeft -=
                                newScrollX = (- lastClientX + (lastClientX = e.clientX));
                            scroller.scrollTop -=
                                newScrollY = (- lastClientY + (lastClientY = e.clientY));
                            if (el == _document.body) {
                                (scroller = _document.documentElement).scrollLeft -= newScrollX;
                                scroller.scrollTop -= newScrollY;
                            }
                        }
                    }, 0
                );
            })(dragged[i++]);
        }
    }


    if (_document.readyState == 'complete') {
        reset();
    } else {
        _window[addEventListener]('load', reset, 0);
    }

    exports.reset = reset;
}));


//Zoomm Function
window.onload = function () {
    PageMethods.GetPossibleResults(onPossibleResultsSuccess, onPossibleResultsFailure);
}
function handleEnter(obj, event) {
    var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
    if (keyCode == 13) {
        document.getElementById(obj).click();
        return false;
    }
    else {
        return true;
    }
}
function zoomin() {
    var myImg = document.getElementById("bigImage");
    var currWidth = myImg.clientWidth;
    var currHeight = myImg.clientHeight;
    if (currWidth >= 2500) {
        document.getElementById("TestTextbox").value = "Width was outside 2500; Value was " + currWidth;
        return false;
    }
    else {
        myImg.style.width = (currWidth + 50) + "px";
        document.getElementById("TestTextbox").value = "Width was within 2500; Value was " + currWidth;
    }
}
function zoomout() {

    var myImg = document.getElementById("bigImage");
    var currWidth = myImg.clientWidth;
    var currHeight = myImg.clientHeight;
    if (currWidth <= 100) {
        document.getElementById("TestTextbox").value = "Width was outside 100; Value was " + currWidth;
        return false;
    }
    else {
        myImg.style.width = (currWidth - 50) + "px";
        document.getElementById("TestTextbox").value = "Width was within 100; Value was " + currWidth;
    }
}


//Search Auto-Suggest
function onPossibleResultsSuccess(result) {
    $("#TextBoxSearch").autocomplete({
        source: result
    });
}
function onPossibleResultsFailure(error) {
    alert(error);
}
function onSearchSuccess(result) {
}
function onSearchFailure(error) {
}
