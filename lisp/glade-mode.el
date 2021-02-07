<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: glade-mode.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="https://www.emacswiki.org/emacs?action=edit;id=glade-mode.el" /><link type="text/css" rel="stylesheet" href="https://www.emacswiki.org/light.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="https://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: glade-mode.el" href="https://www.emacswiki.org/emacs?action=rss;rcidonly=glade-mode.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="https://www.emacswiki.org/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="https://www.emacswiki.org/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="https://www.emacswiki.org/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for glade-mode.el only"
      href="https://www.emacswiki.org/emacs?action=rss;rcidonly=glade-mode.el" /><meta content="width=device-width" name="viewport" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
	var oldOnload = window.onload;
	window.onload = function ( e ) {
	  oldOnload( e );
	  window[fnc]();
	};
      }
      else
	window.onload = fnc;
    }
  }

  // https://stackoverflow.com/questions/280634/endswith-in-javascript
  if (typeof String.prototype.endsWith !== 'function') {
    String.prototype.endsWith = function(suffix) {
      return this.indexOf(suffix, this.length - suffix.length) !== -1;
    };
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
	|| outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
	var divs = document.getElementsByTagName('div');
	for (var i = 0; i < divs.length; i++) {
	  if (divs[i].getAttribute('class') == 'toc') {
	    toc = divs[i];
	    break;
	  }
	}
      }

      if (!toc) {
	var h2 = document.getElementsByTagName('h2')[0];
	if (h2) {
	  toc = document.createElement('div');
	  toc.setAttribute('class', 'toc');
	  h2.parentNode.insertBefore(toc, h2);
	}
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;

	items = toc.getElementsByTagName('a');
	for (var i = 0; i < items.length; i++) {
	  while (items[i].textContent.endsWith('✎')) {
            var text = items[i].childNodes[0].nodeValue;
	    items[i].childNodes[0].nodeValue = text.substring(0, text.length - 1);
	  }
	}
      }
    }
  }

  addOnloadEvent(initToc);
  </script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="default" lang="en"><div class="header"><a class="logo" href="https://www.emacswiki.org/emacs/SiteMap"><img alt="[Home]" class="logo" src="https://www.emacswiki.org/images/logo218x38.png" /></a><div class="menu"><span class="gotobar bar"><a class="local" href="https://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="https://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="https://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="https://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="https://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="https://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="https://www.emacswiki.org/emacs/News">News</a> <a class="local" href="https://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="https://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><form method="get" action="https://www.emacswiki.org/emacs" enctype="multipart/form-data" accept-charset="utf-8" class="search"><p><label for="search">Search:</label> <input type="text" name="search"  size="15" accesskey="f" id="search" /> <label for="searchlang">Language:</label> <input type="text" name="lang"  size="5" id="searchlang" /> <input type="submit" name="dosearch" value="Go!" /></p></form></div><h1><a href="https://www.emacswiki.org/emacs?search=%22glade-mode%5c.el%22" rel="nofollow" title="Click to search for references to this page">glade-mode.el</a></h1></div><div class="wrapper"><div class="content browse" lang="en"><p class="download"><a href="http://www.emacswiki.org/emacs/download/glade-mode.el">Download</a></p><pre><span class="comment">;;; glade-mode.el --- A mode to view glade interface using tree-widget</span>

<span class="comment">;; Copyright 2007 Ye Wenbin</span>
<span class="comment">;;</span>
<span class="comment">;; Author: wenbinye@163.com</span>
<span class="comment">;; Version: $Id: glade-mode.el,v 0.0 2007/06/16 12:08:19 ywb Exp $</span>
<span class="comment">;; Keywords: </span>
<span class="comment">;; X-URL: not distributed yet</span>

<span class="comment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="comment">;; it under the terms of the GNU General Public License as published by</span>
<span class="comment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="comment">;; any later version.</span>
<span class="comment">;;</span>
<span class="comment">;; This program is distributed in the hope that it will be useful,</span>
<span class="comment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="comment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="comment">;; GNU General Public License for more details.</span>
<span class="comment">;;</span>
<span class="comment">;; You should have received a copy of the GNU General Public License</span>
<span class="comment">;; along with this program; if not, write to the Free Software</span>
<span class="comment">;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.</span>

<span class="comment">;;; Commentary<span class="builtin">:</span></span>

<span class="comment">;; 1. Why I write it?</span>
<span class="comment">;;    Sometimes, I use glade draw a interface, I forget what signal I</span>
<span class="comment">;;    used for a widget, I have to swap Emacs from coding to Glade to</span>
<span class="comment">;;    look up for the signal. The other way is open the glade file to</span>
<span class="comment">;;    search. But I hate the markup label, and I want a easy way for</span>
<span class="comment">;;    me to browse the whole file. So I think use tree-widget to</span>
<span class="comment">;;    represent the glade interface is necessary.</span>
<span class="comment">;;</span>
<span class="comment">;; 2. Can it modify glade file?</span>
<span class="comment">;;    Currently not. But I think it is not hard to edit current</span>
<span class="comment">;;    content in the xml. It really hard to add something to the xml.</span>
<span class="comment">;;    Because I don't know what is valid to add to file.</span>
<span class="comment">;;</span>
<span class="comment">;; 3. How to invocate glade-mode automaticly when open .glade file?</span>
<span class="comment">;;    Because magic-mode-alist is used before auto-mode-alist, So you</span>
<span class="comment">;;    have to add a regexp to magic-mode-alist<span class="builtin">:</span></span>
<span class="comment">;;    (add-to-list 'magic-mode-alist</span>
<span class="comment">;;      '(<span class="string">"&lt;\\?xml[ \t\r\n]+[<span class="negation">^</span>&gt;]*&gt;[ \t\r\n]*&lt;!DOCTYPE glade-interface"</span> . glade-mode))</span>
<span class="comment">;;</span>
<span class="comment">;; 4. Where to get and put the icons?</span>
<span class="comment">;;    The icons used can be download from http<span class="builtin">://glade</span>.gnome.org/download.html.</span>
<span class="comment">;;    For current release, they are in directory pixmaps/16x16. I</span>
<span class="comment">;;    extract the map between the icon and GtkWidget type from</span>
<span class="comment">;;    widgets/gtk+.xml. tree-widget library find icon in directories</span>
<span class="comment">;;    list `<span class="constant important">tree-widget-themes-load-path</span>'. You can copy pixmaps/16x16</span>
<span class="comment">;;    to one of the directories with name <span class="string">"glade"</span>. For example, If you</span>
<span class="comment">;;    add <span class="string">"~/.emacs.d/"</span> to the `<span class="constant important">tree-widget-themes-load-path</span>', the</span>
<span class="comment">;;    icons should in <span class="string">"~/.emacs.d/tree-widget/glade"</span>.</span>
<span class="comment">;;</span>
<span class="comment">;; At last, Note this lib use `<span class="constant important">tree-mode</span>', which can be download from<span class="builtin">:</span></span>
<span class="comment">;; http<span class="builtin">://www</span>.emacswiki.org/cgi-bin/emacs/tree-mode.el</span>

<span class="comment">;; Put this file into your load-path and the following into your ~/.emacs<span class="builtin">:</span></span>
<span class="comment">;;   (<span class="keyword">require</span> '<span class="constant">glade-mode</span>)</span>

<span class="comment">;;; Code<span class="builtin">:</span></span>

(<span class="keyword">provide</span> '<span class="constant">glade-mode</span>)
(<span class="keyword elisp">eval-when-compile</span>
  (<span class="keyword">require</span> '<span class="constant">cl</span>))

(<span class="keyword">require</span> '<span class="constant">tree-mode</span>)
(<span class="keyword">require</span> '<span class="constant">xml</span>)

<span class="comment">;;{{{  icon list</span>
(<span class="keyword">defvar</span> <span class="variable">glade-icon-alist</span>
  '((<span class="string">"GtkWindow"</span> . <span class="string">"window"</span>)
    (<span class="string">"GtkMenuItem"</span> . <span class="string">"menuitem"</span>)
    (<span class="string">"GtkCheckMenuItem"</span> . <span class="string">"checkmenuitem"</span>)
    (<span class="string">"GtkRadioMenuItem"</span> . <span class="string">"radiomenuitem"</span>)
    (<span class="string">"GtkImageMenuItem"</span> . <span class="string">"imagemenuitem"</span>)
    (<span class="string">"GtkSeparatorMenuItem"</span> . <span class="string">"separatormenuitem"</span>)
    (<span class="string">"GtkMenuBar"</span> . <span class="string">"menubar"</span>)
    (<span class="string">"GtkToolbar"</span> . <span class="string">"toolbar"</span>)
    (<span class="string">"GtkToolItem"</span> . <span class="string">"toolitem"</span>)
    (<span class="string">"GtkSeparatorToolItem"</span> . <span class="string">"separatortoolitem"</span>)
    (<span class="string">"GtkToolButton"</span> . <span class="string">"toolbutton"</span>)
    (<span class="string">"GtkToggleToolButton"</span> . <span class="string">"toggletoolbutton"</span>)
    (<span class="string">"GtkRadioToolButton"</span> . <span class="string">"radiotoolbutton"</span>)
    (<span class="string">"GtkMenuToolButton"</span> . <span class="string">"menutoolbutton"</span>)
    (<span class="string">"GtkHandleBox"</span> . <span class="string">"handlebox"</span>)
    (<span class="string">"GtkLabel"</span> . <span class="string">"label"</span>)
    (<span class="string">"GtkEntry"</span> . <span class="string">"entry"</span>)
    (<span class="string">"GtkTextView"</span> . <span class="string">"textview"</span>)
    (<span class="string">"GtkButton"</span> . <span class="string">"button"</span>)
    (<span class="string">"GtkToggleButton"</span> . <span class="string">"togglebutton"</span>)
    (<span class="string">"GtkCheckButton"</span> . <span class="string">"checkbutton"</span>)
    (<span class="string">"GtkSpinButton"</span> . <span class="string">"spinbutton"</span>)
    (<span class="string">"GtkRadioButton"</span> . <span class="string">"radiobutton"</span>)
    (<span class="string">"GtkFileChooserButton"</span> . <span class="string">"filechooserbutton"</span>)
    (<span class="string">"GtkColorButton"</span> . <span class="string">"colorbutton"</span>)
    (<span class="string">"GtkFontButton"</span> . <span class="string">"fontbutton"</span>)
    (<span class="string">"GtkComboBox"</span> . <span class="string">"combobox"</span>)
    (<span class="string">"GtkComboBoxEntry"</span> . <span class="string">"comboboxentry"</span>)
    (<span class="string">"GtkTreeView"</span> . <span class="string">"treeview"</span>)
    (<span class="string">"GtkIconView"</span> . <span class="string">"iconview"</span>)
    (<span class="string">"GtkProgressBar"</span> . <span class="string">"progressbar"</span>)
    (<span class="string">"GtkImage"</span> . <span class="string">"image"</span>)
    (<span class="string">"GtkDialog"</span> . <span class="string">"dialog"</span>)
    (<span class="string">"GtkHBox"</span> . <span class="string">"hbox"</span>)
    (<span class="string">"GtkVBox"</span> . <span class="string">"vbox"</span>)
    (<span class="string">"GtkTable"</span> . <span class="string">"table"</span>)
    (<span class="string">"GtkHPaned"</span> . <span class="string">"hpaned"</span>)
    (<span class="string">"GtkVPaned"</span> . <span class="string">"vpaned"</span>)
    (<span class="string">"GtkNotebook"</span> . <span class="string">"notebook"</span>)
    (<span class="string">"GtkAlignment"</span> . <span class="string">"alignment"</span>)
    (<span class="string">"GtkFrame"</span> . <span class="string">"frame"</span>)
    (<span class="string">"GtkAspectFrame"</span> . <span class="string">"aspectframe"</span>)
    (<span class="string">"GtkHScale"</span> . <span class="string">"hscale"</span>)
    (<span class="string">"GtkVScale"</span> . <span class="string">"vscale"</span>)
    (<span class="string">"GtkCalendar"</span> . <span class="string">"calendar"</span>)
    (<span class="string">"GtkMenu"</span> . <span class="string">"menu"</span>)
    (<span class="string">"GtkHScrollbar"</span> . <span class="string">"hscrollbar"</span>)
    (<span class="string">"GtkVScrollbar"</span> . <span class="string">"vscrollbar"</span>)
    (<span class="string">"GtkHButtonBox"</span> . <span class="string">"hbuttonbox"</span>)
    (<span class="string">"GtkVButtonBox"</span> . <span class="string">"vbuttonbox"</span>)
    (<span class="string">"GtkHSeparator"</span> . <span class="string">"hseparator"</span>)
    (<span class="string">"GtkVSeparator"</span> . <span class="string">"vseparator"</span>)
    (<span class="string">"GtkStatusbar"</span> . <span class="string">"statusbar"</span>)
    (<span class="string">"GtkAccelLabel"</span> . <span class="string">"accellabel"</span>)
    (<span class="string">"GtkArrow"</span> . <span class="string">"arrow"</span>)
    (<span class="string">"GtkLayout"</span> . <span class="string">"layout"</span>)
    (<span class="string">"GtkFixed"</span> . <span class="string">"fixed"</span>)
    (<span class="string">"GtkDrawingArea"</span> . <span class="string">"drawingarea"</span>)
    (<span class="string">"GtkEventBox"</span> . <span class="string">"eventbox"</span>)
    (<span class="string">"GtkExpander"</span> . <span class="string">"expander"</span>)
    (<span class="string">"GtkViewport"</span> . <span class="string">"viewport"</span>)
    (<span class="string">"GtkScrolledWindow"</span> . <span class="string">"scrolledwindow"</span>)
    (<span class="string">"GtkAboutDialog"</span> . <span class="string">"aboutdialog"</span>)
    (<span class="string">"GtkColorSelectionDialog"</span> . <span class="string">"colorselectiondialog"</span>)
    (<span class="string">"GtkFileChooserDialog"</span> . <span class="string">"filechooserdialog"</span>)
    (<span class="string">"GtkFontSelectionDialog"</span> . <span class="string">"fontselectiondialog"</span>)
    (<span class="string">"GtkInputDialog"</span> . <span class="string">"inputdialog"</span>)
    (<span class="string">"GtkMessageDialog"</span> . <span class="string">"messagedialog"</span>)
    (<span class="string">"GtkRuler"</span> . <span class="string">"ruler"</span>)
    (<span class="string">"GtkHRuler"</span> . <span class="string">"hruler"</span>)
    (<span class="string">"GtkVRuler"</span> . <span class="string">"vruler"</span>)
    (<span class="string">"GtkCombo"</span> . <span class="string">"combo"</span>)
    (<span class="string">"GtkOptionMenu"</span> . <span class="string">"optionmenu"</span>)
    (<span class="string">"GtkList"</span> . <span class="string">"list"</span>)
    (<span class="string">"GtkListItem"</span> . <span class="string">"listitem"</span>)
    (<span class="string">"GtkCList"</span> . <span class="string">"clist"</span>)
    (<span class="string">"GtkColorSelection"</span> . <span class="string">"colorselection"</span>)
    (<span class="string">"GtkFontSelection"</span> . <span class="string">"fontselection"</span>)
    (<span class="string">"GtkCurve"</span> . <span class="string">"curve"</span>)
    (<span class="string">"GtkGammaCurve"</span> . <span class="string">"gammacurve"</span>)
    (<span class="string">"GtkFileSelection"</span> . <span class="string">"fileselection"</span>)
    (<span class="string">"Custom"</span> . <span class="string">"custom"</span>))
  <span class="string">"Map gtk widget type to icon"</span>)
<span class="comment">;;}}}</span>

(<span class="keyword">defvar</span> <span class="variable">glade-conf-widget</span> nil
  <span class="string">"Widget to edit in *glade* buffer"</span>)
(<span class="keyword">defvar</span> <span class="variable">glade-buffer-file-name</span> nil
  <span class="string">"The buffer assoc file name"</span>)
  
(<span class="keyword">define-derived-mode</span> <span class="function">glade-mode</span> tree-mode <span class="string">"Glade"</span>
  <span class="string">"Mode to view glade interface"</span>
  (<span class="keyword elisp">let</span> (xml)
    (tree-widget-set-theme <span class="string">"glade"</span>)
    (widen)
    (setq xml (xml-parse-region (point-min) (point-max)))
    (set (make-local-variable 'glade-buffer-file-name)
         buffer-file-name)
    (setq buffer-file-name nil)
    (<span class="keyword elisp">let</span> ((inhibit-read-only t))
      (erase-buffer)
      (<span class="keyword cl">dolist</span> (toplevel (xml-get-children (car xml) 'widget))
        (tree-mode-insert (glade-tree-widget toplevel))))
    (setq buffer-read-only t)
    (auto-save-mode 0)
    (goto-char (point-min))))

(<span class="keyword">defun</span> <span class="function">glade-mode-quit</span> (arg)
  (interactive <span class="string">"P"</span>)
  (setq buffer-read-only nil)
  (setq buffer-file-name glade-buffer-file-name)
  (<span class="keyword elisp">if</span> buffer-file-name
      (<span class="keyword elisp">let</span> ((auto-mode-alist nil)
            (magic-mode-alist nil))
        (revert-buffer nil t)
        (xml-mode))))

<span class="comment">;;{{{  Build widget</span>
(<span class="keyword">defun</span> <span class="function">glade-tree-widget</span> (widget)
  (<span class="keyword elisp">let</span> ((children (xml-get-children widget 'child)))
    (<span class="keyword elisp">if</span> (null children)
        (glade-push-button widget)
      `(tree-widget
        <span class="builtin">:node</span> ,(glade-push-button widget)
        ,@(mapcar (<span class="keyword elisp">lambda</span> (c)
                    (glade-tree-widget (glade-child-to-widget c)))
                  (xml-get-children widget 'child))))))

(<span class="keyword">defun</span> <span class="function">glade-push-button</span> (widget)
  (<span class="keyword elisp">if</span> (eq (car widget) 'placeholder)
      `(push-button
        <span class="builtin">:tag</span> <span class="string">"placeholder"</span>
        <span class="builtin">:button-icon</span> ,(or (assoc-default <span class="string">"placeholder"</span> glade-icon-alist)
                          <span class="string">"custom"</span>)
        <span class="builtin">:format</span> <span class="string">"%[%t%]\n"</span>)
    (list 'push-button
          <span class="builtin">:tag</span> (xml-get-attribute widget 'id)
          <span class="builtin">:button-icon</span> (or (assoc-default (xml-get-attribute widget 'class)
                                          glade-icon-alist)
                           <span class="string">"custom"</span>)
          <span class="builtin">:format</span> <span class="string">"%[%t%]\n"</span>
          <span class="builtin">:notify</span> 'glade-show-node
          <span class="builtin">:glade-property</span> (xml-get-children widget 'property)
          <span class="builtin">:glade-accessibility</span> (xml-get-children widget 'accessibility)
          <span class="builtin">:glade-signal</span> (xml-get-children widget 'signal)
          <span class="builtin">:glade-attributes</span> (xml-node-attributes widget)
          <span class="builtin">:glade-accelerator</span> (xml-get-children widget 'accelerator)
          <span class="builtin">:glade-packing</span> (car (xml-get-children widget 'packing)))))

<span class="comment">;; every child may have a attribute <span class="string">"internal-child"</span>, and may have</span>
<span class="comment">;; packing node. But the tree widget only show the widget node, so I</span>
<span class="comment">;; add internal-child to widget's attributes and packing node to</span>
<span class="comment">;; widget's child</span>
(<span class="keyword">defun</span> <span class="function">glade-child-to-widget</span> (child)
  (<span class="keyword elisp">let</span> ((widget (car (or (xml-get-children child 'widget)
                         (xml-get-children child 'placeholder)))))
    (cons (car widget)
          (cons (append (xml-node-attributes widget)
                        (xml-get-attribute-or-nil child 'internal-child))
                (append (xml-node-children widget)
                        (xml-get-children child 'packing))))))
<span class="comment">;;}}}</span>

(<span class="keyword">defun</span> <span class="function">glade-tree-flat-map</span> (func tree)
  (<span class="keyword elisp">if</span> (tree-widget-p tree)
      (apply 'append (mapcar (<span class="keyword elisp">lambda</span> (child)
                               (glade-tree-flat-map func child))
                             (widget-get tree <span class="builtin">:children</span>)))
    (list (funcall func tree))))

(<span class="keyword">define-derived-mode</span> <span class="function">glade-conf-mode</span> conf-unix-mode <span class="string">"Glade-Conf"</span>
  <span class="string">"Configure mode for glade"</span>
  (make-local-variable 'glade-conf-widget))

(<span class="keyword">defun</span> <span class="function">glade-list-signal</span> ()
  (interactive)
  (<span class="keyword elisp">let</span> ((tree (tree-mode-tree-ap)))
    (<span class="keyword elisp">if</span> (null tree)
        (message <span class="string">"No widget at point!"</span>)
      (<span class="keyword elisp">with-current-buffer</span> (get-buffer-create <span class="string">"*glade*"</span>)
        (<span class="keyword cl">unless</span> (eq major-mode 'glade-conf-mode)
          (glade-conf-mode))
        (erase-buffer)
        (setq glade-conf-widget tree)
        (<span class="keyword cl">dolist</span> (widget (delq nil (glade-tree-flat-map
                                   (<span class="keyword elisp">lambda</span> (but)
                                     (and (widget-get but <span class="builtin">:glade-signal</span>)
                                          (cons (widget-get but <span class="builtin">:tag</span>)
                                                (widget-get but <span class="builtin">:glade-signal</span>))))
                                   tree)))
          (insert <span class="string">"["</span> (car widget) <span class="string">"]\n"</span>)
          (<span class="keyword cl">dolist</span> (sig (cdr widget))
            (insert (format <span class="string">"%-20s = %s\n"</span>
                            (xml-get-attribute sig 'name)
                            (xml-get-attribute sig 'handler))))
          (insert <span class="string">"\n"</span>))
        (<span class="keyword elisp">if</span> (= (buffer-size) 0)
            (message <span class="string">"No signal found!"</span>)
          (display-buffer (current-buffer)))))))

(<span class="keyword">defun</span> <span class="function">glade-show-node</span> (widget <span class="type">&amp;rest</span> ignore)
  (<span class="keyword elisp">with-current-buffer</span> (get-buffer-create <span class="string">"*glade*"</span>)
    (<span class="keyword cl">unless</span> (eq major-mode 'glade-conf-mode)
      (glade-conf-mode))
    (erase-buffer)
    (setq glade-conf-widget widget)
    (<span class="keyword cl">dolist</span> (prop (widget-get widget <span class="builtin">:glade-property</span>))
      (insert <span class="string">"[property]\n"</span>)
      (<span class="keyword cl">dolist</span> (attr (xml-node-attributes prop))
        (insert (format <span class="string">"%-20S = %s\n"</span>
                        (car attr)
                        (cdr attr))))
      (insert (format <span class="string">"%-20s = %s\n"</span>
                      <span class="string">"DATA"</span> (car (xml-node-children prop))))
      (insert <span class="string">"\n"</span>))
    (<span class="keyword cl">dolist</span> (feat '(<span class="builtin">:glade-signal</span> <span class="builtin">:glade-accelerator</span>))
      (<span class="keyword cl">dolist</span> (sig (widget-get widget feat))
        (insert (format <span class="string">"[%s]\n"</span>
                        (substring (symbol-name feat) 7)))
        (<span class="keyword cl">dolist</span> (attr (xml-node-attributes sig))
          (insert (format <span class="string">"%-20S = %s\n"</span>
                          (car attr)
                          (cdr attr))))
        (insert <span class="string">"\n"</span>)))
    (<span class="keyword cl">when</span> (widget-get widget <span class="builtin">:glade-packing</span>)
      (insert <span class="string">"[packing]\n"</span>)
      (<span class="keyword cl">dolist</span> (prop (xml-get-children (widget-get widget <span class="builtin">:glade-packing</span>) 'property))
        (insert (format <span class="string">"%-20s = %s\n"</span>
                        (xml-get-attribute prop 'name)
                        (car (xml-node-children prop))))))
    (display-buffer (current-buffer))))

(define-key glade-mode-map <span class="string">"\C-c\C-c"</span> 'glade-mode-quit)

<span class="comment">;;; glade-mode.el ends here</span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="translation bar"><br />  <a class="translation new" href="https://www.emacswiki.org/emacs?action=translate;id=glade-mode.el;missing=de_es_fr_it_ja_ko_pt_ru_se_uk_zh" rel="nofollow">Add Translation</a></span><div class="edit bar"><a accesskey="c" class="comment local edit" href="https://www.emacswiki.org/emacs/Comments_on_glade-mode.el">Talk</a> <a accesskey="e" class="edit" href="https://www.emacswiki.org/emacs?action=edit;id=glade-mode.el" rel="nofollow" title="Click to edit this page">Edit this page</a> <a class="history" href="https://www.emacswiki.org/emacs?action=history;id=glade-mode.el" rel="nofollow">View other revisions</a> <a class="admin" href="https://www.emacswiki.org/emacs?action=admin;id=glade-mode.el" rel="nofollow">Administration</a></div><div class="time">Last edited 2013-08-24 12:05 UTC by <a class="author" href="https://www.emacswiki.org/emacs/AlexSchroeder">AlexSchroeder</a> <a class="diff" href="https://www.emacswiki.org/emacs?action=browse;diff=2;id=glade-mode.el" rel="nofollow">(diff)</a></div><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a class="licence" href="https://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="https://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="https://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="https://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="https://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="https://creativecommons.org/">CreativeCommons</a>
<a href="https://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
<p class="legal" style="padding-top: 0.5em">Please note our <a href="/emacs/Privacy">Privacy Statement</a>.</p>
</div>
</body>
</html>
