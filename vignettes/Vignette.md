<!DOCTYPE html>

<html>

<head>

<meta charset="utf-8" />
<meta name="generator" content="pandoc" />
<meta http-equiv="X-UA-Compatible" content="IE=EDGE" />

<meta name="viewport" content="width=device-width, initial-scale=1" />



<title>Rbduk</title>


<style type="text/css">
  code{white-space: pre-wrap;}
  span.smallcaps{font-variant: small-caps;}
  span.underline{text-decoration: underline;}
  div.column{display: inline-block; vertical-align: top; width: 50%;}
  div.hanging-indent{margin-left: 1.5em; text-indent: -1.5em;}
  ul.task-list{list-style: none;}
    </style>


<style type="text/css">code{white-space: pre;}</style>
<style type="text/css" data-origin="pandoc">
a.sourceLine { display: inline-block; line-height: 1.25; }
a.sourceLine { pointer-events: none; color: inherit; text-decoration: inherit; }
a.sourceLine:empty { height: 1.2em; }
.sourceCode { overflow: visible; }
code.sourceCode { white-space: pre; position: relative; }
div.sourceCode { margin: 1em 0; }
pre.sourceCode { margin: 0; }
@media screen {
div.sourceCode { overflow: auto; }
}
@media print {
code.sourceCode { white-space: pre-wrap; }
a.sourceLine { text-indent: -1em; padding-left: 1em; }
}
pre.numberSource a.sourceLine
  { position: relative; left: -4em; }
pre.numberSource a.sourceLine::before
  { content: attr(data-line-number);
    position: relative; left: -1em; text-align: right; vertical-align: baseline;
    border: none; pointer-events: all; display: inline-block;
    -webkit-touch-callout: none; -webkit-user-select: none;
    -khtml-user-select: none; -moz-user-select: none;
    -ms-user-select: none; user-select: none;
    padding: 0 4px; width: 4em;
    color: #aaaaaa;
  }
pre.numberSource { margin-left: 3em; border-left: 1px solid #aaaaaa;  padding-left: 4px; }
div.sourceCode
  {  }
@media screen {
a.sourceLine::before { text-decoration: underline; }
}
code span.al { color: #ff0000; font-weight: bold; } /* Alert */
code span.an { color: #60a0b0; font-weight: bold; font-style: italic; } /* Annotation */
code span.at { color: #7d9029; } /* Attribute */
code span.bn { color: #40a070; } /* BaseN */
code span.bu { } /* BuiltIn */
code span.cf { color: #007020; font-weight: bold; } /* ControlFlow */
code span.ch { color: #4070a0; } /* Char */
code span.cn { color: #880000; } /* Constant */
code span.co { color: #60a0b0; font-style: italic; } /* Comment */
code span.cv { color: #60a0b0; font-weight: bold; font-style: italic; } /* CommentVar */
code span.do { color: #ba2121; font-style: italic; } /* Documentation */
code span.dt { color: #902000; } /* DataType */
code span.dv { color: #40a070; } /* DecVal */
code span.er { color: #ff0000; font-weight: bold; } /* Error */
code span.ex { } /* Extension */
code span.fl { color: #40a070; } /* Float */
code span.fu { color: #06287e; } /* Function */
code span.im { } /* Import */
code span.in { color: #60a0b0; font-weight: bold; font-style: italic; } /* Information */
code span.kw { color: #007020; font-weight: bold; } /* Keyword */
code span.op { color: #666666; } /* Operator */
code span.ot { color: #007020; } /* Other */
code span.pp { color: #bc7a00; } /* Preprocessor */
code span.sc { color: #4070a0; } /* SpecialChar */
code span.ss { color: #bb6688; } /* SpecialString */
code span.st { color: #4070a0; } /* String */
code span.va { color: #19177c; } /* Variable */
code span.vs { color: #4070a0; } /* VerbatimString */
code span.wa { color: #60a0b0; font-weight: bold; font-style: italic; } /* Warning */

</style>
<script>
// apply pandoc div.sourceCode style to pre.sourceCode instead
(function() {
  var sheets = document.styleSheets;
  for (var i = 0; i < sheets.length; i++) {
    if (sheets[i].ownerNode.dataset["origin"] !== "pandoc") continue;
    try { var rules = sheets[i].cssRules; } catch (e) { continue; }
    for (var j = 0; j < rules.length; j++) {
      var rule = rules[j];
      // check if there is a div.sourceCode rule
      if (rule.type !== rule.STYLE_RULE || rule.selectorText !== "div.sourceCode") continue;
      var style = rule.style.cssText;
      // check if color or background-color is set
      if (rule.style.color === '' && rule.style.backgroundColor === '') continue;
      // replace div.sourceCode by a pre.sourceCode rule
      sheets[i].deleteRule(j);
      sheets[i].insertRule('pre.sourceCode{' + style + '}', j);
    }
  }
})();
</script>




<style type="text/css">body {
background-color: #fff;
margin: 1em auto;
max-width: 700px;
overflow: visible;
padding-left: 2em;
padding-right: 2em;
font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
font-size: 14px;
line-height: 1.35;
}
#TOC {
clear: both;
margin: 0 0 10px 10px;
padding: 4px;
width: 400px;
border: 1px solid #CCCCCC;
border-radius: 5px;
background-color: #f6f6f6;
font-size: 13px;
line-height: 1.3;
}
#TOC .toctitle {
font-weight: bold;
font-size: 15px;
margin-left: 5px;
}
#TOC ul {
padding-left: 40px;
margin-left: -1.5em;
margin-top: 5px;
margin-bottom: 5px;
}
#TOC ul ul {
margin-left: -2em;
}
#TOC li {
line-height: 16px;
}
table {
margin: 1em auto;
border-width: 1px;
border-color: #DDDDDD;
border-style: outset;
border-collapse: collapse;
}
table th {
border-width: 2px;
padding: 5px;
border-style: inset;
}
table td {
border-width: 1px;
border-style: inset;
line-height: 18px;
padding: 5px 5px;
}
table, table th, table td {
border-left-style: none;
border-right-style: none;
}
table thead, table tr.even {
background-color: #f7f7f7;
}
p {
margin: 0.5em 0;
}
blockquote {
background-color: #f6f6f6;
padding: 0.25em 0.75em;
}
hr {
border-style: solid;
border: none;
border-top: 1px solid #777;
margin: 28px 0;
}
dl {
margin-left: 0;
}
dl dd {
margin-bottom: 13px;
margin-left: 13px;
}
dl dt {
font-weight: bold;
}
ul {
margin-top: 0;
}
ul li {
list-style: circle outside;
}
ul ul {
margin-bottom: 0;
}
pre, code {
background-color: #f7f7f7;
border-radius: 3px;
color: #333;
white-space: pre-wrap; 
}
pre {
border-radius: 3px;
margin: 5px 0px 10px 0px;
padding: 10px;
}
pre:not([class]) {
background-color: #f7f7f7;
}
code {
font-family: Consolas, Monaco, 'Courier New', monospace;
font-size: 85%;
}
p > code, li > code {
padding: 2px 0px;
}
div.figure {
text-align: center;
}
img {
background-color: #FFFFFF;
padding: 2px;
border: 1px solid #DDDDDD;
border-radius: 3px;
border: 1px solid #CCCCCC;
margin: 0 5px;
}
h1 {
margin-top: 0;
font-size: 35px;
line-height: 40px;
}
h2 {
border-bottom: 4px solid #f7f7f7;
padding-top: 10px;
padding-bottom: 2px;
font-size: 145%;
}
h3 {
border-bottom: 2px solid #f7f7f7;
padding-top: 10px;
font-size: 120%;
}
h4 {
border-bottom: 1px solid #f7f7f7;
margin-left: 8px;
font-size: 105%;
}
h5, h6 {
border-bottom: 1px solid #ccc;
font-size: 105%;
}
a {
color: #0033dd;
text-decoration: none;
}
a:hover {
color: #6666ff; }
a:visited {
color: #800080; }
a:visited:hover {
color: #BB00BB; }
a[href^="http:"] {
text-decoration: underline; }
a[href^="https:"] {
text-decoration: underline; }

code > span.kw { color: #555; font-weight: bold; } 
code > span.dt { color: #902000; } 
code > span.dv { color: #40a070; } 
code > span.bn { color: #d14; } 
code > span.fl { color: #d14; } 
code > span.ch { color: #d14; } 
code > span.st { color: #d14; } 
code > span.co { color: #888888; font-style: italic; } 
code > span.ot { color: #007020; } 
code > span.al { color: #ff0000; font-weight: bold; } 
code > span.fu { color: #900; font-weight: bold; } 
code > span.er { color: #a61717; background-color: #e3d2d2; } 
</style>




</head>

<body>




<h1 class="title toc-ignore">Rbduk</h1>



<div id="general-functions" class="section level2">
<h2>General functions</h2>
<div id="is_integer64" class="section level3">
<h3>is_integer64()</h3>
<p>Within GCP, large numbers (eg UPRNs) are stored are 64-bit integers. R, on the whole, does not like 64-bit integer, and whilst it can cope, it’s easier to read in these columns are numeric, or convert them to numeric within R. To see if an object is currently a 64-bit integer, this function can be used.</p>
<div class="sourceCode" id="cb1"><pre class="sourceCode r"><code class="sourceCode r"><a class="sourceLine" id="cb1-1" data-line-number="1"><span class="kw">is_integer64</span>(<span class="dv">100</span>)</a>
<a class="sourceLine" id="cb1-2" data-line-number="2"><span class="co">#&gt; [1] FALSE</span></a>
<a class="sourceLine" id="cb1-3" data-line-number="3"></a>
<a class="sourceLine" id="cb1-4" data-line-number="4"><span class="kw">is_integer64</span>(<span class="st">&quot;x&quot;</span>)</a>
<a class="sourceLine" id="cb1-5" data-line-number="5"><span class="co">#&gt; [1] FALSE</span></a></code></pre></div>
</div>
<div id="pretty_postcode" class="section level3">
<h3>pretty_postcode()</h3>
<p>This function takes a postcode in any format and any case, and converts it into pretty format XX(X)(X)(Y)XXX, where X is the postcode, and Y is the specified seperator, which is a space by default. The case can also be specified, and is upper case by default.</p>
<div class="sourceCode" id="cb2"><pre class="sourceCode r"><code class="sourceCode r"><a class="sourceLine" id="cb2-1" data-line-number="1"><span class="kw">pretty_postcode</span>(<span class="st">&quot;SW1a2nP&quot;</span>)</a>
<a class="sourceLine" id="cb2-2" data-line-number="2"><span class="co">#&gt; [1] &quot;SW1A 2NP&quot;</span></a>
<a class="sourceLine" id="cb2-3" data-line-number="3"></a>
<a class="sourceLine" id="cb2-4" data-line-number="4"><span class="kw">pretty_postcode</span>(<span class="st">&quot;SW1a2nP&quot;</span>, <span class="dt">sep=</span><span class="st">&quot;&quot;</span>)</a>
<a class="sourceLine" id="cb2-5" data-line-number="5"><span class="co">#&gt; [1] &quot;SW1A2NP&quot;</span></a>
<a class="sourceLine" id="cb2-6" data-line-number="6"></a>
<a class="sourceLine" id="cb2-7" data-line-number="7"><span class="kw">pretty_postcode</span>(<span class="st">&quot;SW1a2nP&quot;</span>, <span class="dt">sep=</span><span class="st">&quot;.&quot;</span>)</a>
<a class="sourceLine" id="cb2-8" data-line-number="8"><span class="co">#&gt; [1] &quot;SW1A.2NP&quot;</span></a>
<a class="sourceLine" id="cb2-9" data-line-number="9"></a>
<a class="sourceLine" id="cb2-10" data-line-number="10"><span class="kw">pretty_postcode</span>(<span class="st">&quot;SW1a2nP&quot;</span>, <span class="dt">sep=</span><span class="st">&quot;.&quot;</span>, <span class="dt">uppercase=</span><span class="ot">FALSE</span>)</a>
<a class="sourceLine" id="cb2-11" data-line-number="11"><span class="co">#&gt; [1] &quot;sw1a.2np&quot;</span></a></code></pre></div>
</div>
<div id="is_postcode" class="section level3">
<h3>is_postcode()</h3>
<p>This function takes a string and returns TRUE or FALSE depedent on whether the string is in a valid UK postcode format or not. This may contain one space and still be valid. This does not indicate whether a postcode is an existing postcode, but that is has the format of one.</p>
<p>The following demonstrates valid postcodes and invalid postcodes:</p>
<div class="sourceCode" id="cb3"><pre class="sourceCode r"><code class="sourceCode r"><a class="sourceLine" id="cb3-1" data-line-number="1"><span class="kw">is_postcode</span>(<span class="st">&quot;SW1a2nP&quot;</span>)</a>
<a class="sourceLine" id="cb3-2" data-line-number="2"><span class="co">#&gt; [1] TRUE</span></a>
<a class="sourceLine" id="cb3-3" data-line-number="3"></a>
<a class="sourceLine" id="cb3-4" data-line-number="4"><span class="kw">is_postcode</span>(<span class="st">&quot;SW1a 2nP&quot;</span>)</a>
<a class="sourceLine" id="cb3-5" data-line-number="5"><span class="co">#&gt; [1] TRUE</span></a></code></pre></div>
<div class="sourceCode" id="cb4"><pre class="sourceCode r"><code class="sourceCode r"><a class="sourceLine" id="cb4-1" data-line-number="1"><span class="co">#Too short</span></a>
<a class="sourceLine" id="cb4-2" data-line-number="2"><span class="kw">is_postcode</span>(<span class="st">&quot;S 2NP&quot;</span>)</a>
<a class="sourceLine" id="cb4-3" data-line-number="3"><span class="co">#&gt; [1] FALSE</span></a>
<a class="sourceLine" id="cb4-4" data-line-number="4"></a>
<a class="sourceLine" id="cb4-5" data-line-number="5"><span class="co">#Contains punctuation</span></a>
<a class="sourceLine" id="cb4-6" data-line-number="6"><span class="kw">is_postcode</span>(<span class="st">&quot;Sw1a.2np&quot;</span>)</a>
<a class="sourceLine" id="cb4-7" data-line-number="7"><span class="co">#&gt; [1] FALSE</span></a>
<a class="sourceLine" id="cb4-8" data-line-number="8"></a>
<a class="sourceLine" id="cb4-9" data-line-number="9"><span class="co">#Too long</span></a>
<a class="sourceLine" id="cb4-10" data-line-number="10"><span class="kw">is_postcode</span>(<span class="st">&quot;Sw1a2npX&quot;</span>)</a>
<a class="sourceLine" id="cb4-11" data-line-number="11"><span class="co">#&gt; [1] FALSE</span></a>
<a class="sourceLine" id="cb4-12" data-line-number="12"></a>
<a class="sourceLine" id="cb4-13" data-line-number="13"><span class="co">#Contains too many spaces</span></a>
<a class="sourceLine" id="cb4-14" data-line-number="14"><span class="kw">is_postcode</span>(<span class="st">&quot;Sw1a  2np&quot;</span>)</a>
<a class="sourceLine" id="cb4-15" data-line-number="15"><span class="co">#&gt; [1] FALSE</span></a>
<a class="sourceLine" id="cb4-16" data-line-number="16"></a>
<a class="sourceLine" id="cb4-17" data-line-number="17"><span class="co">#Not valid number/letter combiantion</span></a>
<a class="sourceLine" id="cb4-18" data-line-number="18"><span class="kw">is_postcode</span>(<span class="st">&quot;000000&quot;</span>)</a>
<a class="sourceLine" id="cb4-19" data-line-number="19"><span class="co">#&gt; [1] FALSE</span></a>
<a class="sourceLine" id="cb4-20" data-line-number="20"></a>
<a class="sourceLine" id="cb4-21" data-line-number="21"><span class="co">#Not valid number/letter combiantion</span></a>
<a class="sourceLine" id="cb4-22" data-line-number="22"><span class="kw">is_postcode</span>(<span class="st">&quot;XXXXXX&quot;</span>)</a>
<a class="sourceLine" id="cb4-23" data-line-number="23"><span class="co">#&gt; [1] FALSE</span></a></code></pre></div>
</div>
<div id="is_uprn" class="section level3">
<h3>is_uprn()</h3>
<p>This function takes a numeric or character vector and returns TRUE or FALSE depedent on whether it is in a valid UPRN format (all numeric, between 1 and 12 characters). It will also flag as a message any UPRNs that end 0000, as a common conversion error caused by scientific notation and reading/writing from excel can cause genuine UPRNs to end in a number of zeros, meaning they are no longer genuine. One or two of these messages is acceptable, but many indicates that this error has occured and that the UPRNs should be checked thoroughly.</p>
<p>The following demonstrates valid and invalid UPRNs:</p>
<div class="sourceCode" id="cb5"><pre class="sourceCode r"><code class="sourceCode r"><a class="sourceLine" id="cb5-1" data-line-number="1"><span class="kw">is_uprn</span>(<span class="dv">1</span>)</a>
<a class="sourceLine" id="cb5-2" data-line-number="2"><span class="co">#&gt; [1] TRUE</span></a>
<a class="sourceLine" id="cb5-3" data-line-number="3"></a>
<a class="sourceLine" id="cb5-4" data-line-number="4"><span class="kw">is_uprn</span>(<span class="dv">999999999999</span>)</a>
<a class="sourceLine" id="cb5-5" data-line-number="5"><span class="co">#&gt; [1] TRUE</span></a>
<a class="sourceLine" id="cb5-6" data-line-number="6"></a>
<a class="sourceLine" id="cb5-7" data-line-number="7"><span class="kw">is_uprn</span>(<span class="st">&quot;1&quot;</span>)</a>
<a class="sourceLine" id="cb5-8" data-line-number="8"><span class="co">#&gt; [1] TRUE</span></a>
<a class="sourceLine" id="cb5-9" data-line-number="9"></a>
<a class="sourceLine" id="cb5-10" data-line-number="10"><span class="kw">is_uprn</span>(<span class="st">&quot;999999999999&quot;</span>)</a>
<a class="sourceLine" id="cb5-11" data-line-number="11"><span class="co">#&gt; [1] TRUE</span></a></code></pre></div>
<div class="sourceCode" id="cb6"><pre class="sourceCode r"><code class="sourceCode r"><a class="sourceLine" id="cb6-1" data-line-number="1"><span class="co">#Too long</span></a>
<a class="sourceLine" id="cb6-2" data-line-number="2"><span class="kw">is_uprn</span>(<span class="dv">9999999999999</span>)</a>
<a class="sourceLine" id="cb6-3" data-line-number="3"><span class="co">#&gt; [1] FALSE</span></a>
<a class="sourceLine" id="cb6-4" data-line-number="4"></a>
<a class="sourceLine" id="cb6-5" data-line-number="5"><span class="co">#Too long</span></a>
<a class="sourceLine" id="cb6-6" data-line-number="6"><span class="kw">is_uprn</span>(<span class="st">&quot;9999999999999&quot;</span>)</a>
<a class="sourceLine" id="cb6-7" data-line-number="7"><span class="co">#&gt; [1] FALSE</span></a>
<a class="sourceLine" id="cb6-8" data-line-number="8"></a>
<a class="sourceLine" id="cb6-9" data-line-number="9"><span class="co">#Empty</span></a>
<a class="sourceLine" id="cb6-10" data-line-number="10"><span class="kw">is_uprn</span>(<span class="st">&quot;&quot;</span>)</a>
<a class="sourceLine" id="cb6-11" data-line-number="11"><span class="co">#&gt; [1] FALSE</span></a>
<a class="sourceLine" id="cb6-12" data-line-number="12"></a>
<a class="sourceLine" id="cb6-13" data-line-number="13"><span class="co">#Letters</span></a>
<a class="sourceLine" id="cb6-14" data-line-number="14"><span class="kw">is_uprn</span>(<span class="st">&quot;ABC&quot;</span>)</a>
<a class="sourceLine" id="cb6-15" data-line-number="15"><span class="co">#&gt; [1] FALSE</span></a>
<a class="sourceLine" id="cb6-16" data-line-number="16"></a>
<a class="sourceLine" id="cb6-17" data-line-number="17"><span class="co">#Contains trailing characters</span></a>
<a class="sourceLine" id="cb6-18" data-line-number="18"><span class="kw">is_uprn</span>(<span class="st">&quot;1,&quot;</span>)</a>
<a class="sourceLine" id="cb6-19" data-line-number="19"><span class="co">#&gt; [1] FALSE</span></a>
<a class="sourceLine" id="cb6-20" data-line-number="20"></a>
<a class="sourceLine" id="cb6-21" data-line-number="21"><span class="co">#Not an integer</span></a>
<a class="sourceLine" id="cb6-22" data-line-number="22"><span class="kw">is_uprn</span>(<span class="fl">111.999</span>)</a>
<a class="sourceLine" id="cb6-23" data-line-number="23"><span class="co">#&gt; [1] FALSE</span></a>
<a class="sourceLine" id="cb6-24" data-line-number="24"></a>
<a class="sourceLine" id="cb6-25" data-line-number="25"><span class="co">#Not an integer</span></a>
<a class="sourceLine" id="cb6-26" data-line-number="26"><span class="kw">is_uprn</span>(<span class="st">&quot;111.999&quot;</span>)</a>
<a class="sourceLine" id="cb6-27" data-line-number="27"><span class="co">#&gt; [1] FALSE</span></a>
<a class="sourceLine" id="cb6-28" data-line-number="28"></a>
<a class="sourceLine" id="cb6-29" data-line-number="29"><span class="co">#Contains punctuation</span></a>
<a class="sourceLine" id="cb6-30" data-line-number="30"><span class="kw">is_uprn</span>(<span class="st">&quot;111-999&quot;</span>)</a>
<a class="sourceLine" id="cb6-31" data-line-number="31"><span class="co">#&gt; [1] FALSE</span></a>
<a class="sourceLine" id="cb6-32" data-line-number="32"></a>
<a class="sourceLine" id="cb6-33" data-line-number="33"><span class="co">#Contains punctuation</span></a>
<a class="sourceLine" id="cb6-34" data-line-number="34"><span class="kw">is_uprn</span>(<span class="st">&quot;111 999&quot;</span>)</a>
<a class="sourceLine" id="cb6-35" data-line-number="35"><span class="co">#&gt; [1] FALSE</span></a></code></pre></div>
</div>
<div id="notin-and-in" class="section level3">
<h3>%notin% and %!in%</h3>
<p>These functions serve the same purpose, and that is to give a more readable version of the opposite of <code>%in%</code>. They output the opposite logical response that <code>%in%</code> would provide.</p>
<div class="sourceCode" id="cb7"><pre class="sourceCode r"><code class="sourceCode r"><a class="sourceLine" id="cb7-1" data-line-number="1"></a>
<a class="sourceLine" id="cb7-2" data-line-number="2"><span class="dv">2</span> <span class="op">%!in%</span><span class="st"> </span><span class="kw">c</span>(<span class="dv">1</span>,<span class="dv">3</span>)</a>
<a class="sourceLine" id="cb7-3" data-line-number="3"><span class="co">#&gt; [1] TRUE</span></a>
<a class="sourceLine" id="cb7-4" data-line-number="4"></a>
<a class="sourceLine" id="cb7-5" data-line-number="5"><span class="dv">2</span> <span class="op">%notin%</span><span class="st"> </span><span class="kw">c</span>(<span class="dv">1</span>,<span class="dv">3</span>)</a>
<a class="sourceLine" id="cb7-6" data-line-number="6"><span class="co">#&gt; [1] TRUE</span></a>
<a class="sourceLine" id="cb7-7" data-line-number="7"></a>
<a class="sourceLine" id="cb7-8" data-line-number="8"><span class="st">&quot;b&quot;</span> <span class="op">%!in%</span><span class="st"> </span><span class="kw">c</span>(<span class="st">&quot;a&quot;</span>,<span class="st">&quot;c&quot;</span>)</a>
<a class="sourceLine" id="cb7-9" data-line-number="9"><span class="co">#&gt; [1] TRUE</span></a>
<a class="sourceLine" id="cb7-10" data-line-number="10"></a>
<a class="sourceLine" id="cb7-11" data-line-number="11"><span class="st">&quot;b&quot;</span> <span class="op">%notin%</span><span class="st"> </span><span class="kw">c</span>(<span class="st">&quot;a&quot;</span>,<span class="st">&quot;c&quot;</span>)</a>
<a class="sourceLine" id="cb7-12" data-line-number="12"><span class="co">#&gt; [1] TRUE</span></a></code></pre></div>
<div class="sourceCode" id="cb8"><pre class="sourceCode r"><code class="sourceCode r"><a class="sourceLine" id="cb8-1" data-line-number="1"></a>
<a class="sourceLine" id="cb8-2" data-line-number="2"><span class="dv">2</span> <span class="op">%!in%</span><span class="st"> </span><span class="kw">c</span>(<span class="dv">1</span>,<span class="dv">2</span>,<span class="dv">3</span>)</a>
<a class="sourceLine" id="cb8-3" data-line-number="3"><span class="co">#&gt; [1] FALSE</span></a>
<a class="sourceLine" id="cb8-4" data-line-number="4"></a>
<a class="sourceLine" id="cb8-5" data-line-number="5"><span class="dv">2</span> <span class="op">%notin%</span><span class="st"> </span><span class="kw">c</span>(<span class="dv">1</span>,<span class="dv">2</span>,<span class="dv">3</span>)</a>
<a class="sourceLine" id="cb8-6" data-line-number="6"><span class="co">#&gt; [1] FALSE</span></a>
<a class="sourceLine" id="cb8-7" data-line-number="7"></a>
<a class="sourceLine" id="cb8-8" data-line-number="8"><span class="st">&quot;b&quot;</span> <span class="op">%!in%</span><span class="st"> </span><span class="kw">c</span>(<span class="st">&quot;a&quot;</span>,<span class="st">&quot;b&quot;</span>,<span class="st">&quot;c&quot;</span>)</a>
<a class="sourceLine" id="cb8-9" data-line-number="9"><span class="co">#&gt; [1] FALSE</span></a>
<a class="sourceLine" id="cb8-10" data-line-number="10"></a>
<a class="sourceLine" id="cb8-11" data-line-number="11"><span class="st">&quot;b&quot;</span> <span class="op">%notin%</span><span class="st"> </span><span class="kw">c</span>(<span class="st">&quot;a&quot;</span>,<span class="st">&quot;b&quot;</span>,<span class="st">&quot;c&quot;</span>)</a>
<a class="sourceLine" id="cb8-12" data-line-number="12"><span class="co">#&gt; [1] FALSE</span></a></code></pre></div>
<div class="sourceCode" id="cb9"><pre class="sourceCode r"><code class="sourceCode r"><a class="sourceLine" id="cb9-1" data-line-number="1"></a>
<a class="sourceLine" id="cb9-2" data-line-number="2"><span class="kw">all.equal</span>(<span class="dv">2</span> <span class="op">%!in%</span><span class="st"> </span><span class="kw">c</span>(<span class="dv">1</span>,<span class="dv">3</span>), <span class="dv">2</span> <span class="op">%notin%</span><span class="st"> </span><span class="kw">c</span>(<span class="dv">1</span>,<span class="dv">3</span>), <span class="op">!</span><span class="dv">2</span> <span class="op">%in%</span><span class="st"> </span><span class="kw">c</span>(<span class="dv">1</span>,<span class="dv">3</span>))</a>
<a class="sourceLine" id="cb9-3" data-line-number="3"><span class="co">#&gt; [1] TRUE</span></a>
<a class="sourceLine" id="cb9-4" data-line-number="4"></a>
<a class="sourceLine" id="cb9-5" data-line-number="5"><span class="kw">all.equal</span>(<span class="st">&quot;b&quot;</span> <span class="op">%!in%</span><span class="st"> </span><span class="kw">c</span>(<span class="st">&quot;a&quot;</span>,<span class="st">&quot;c&quot;</span>), <span class="st">&quot;b&quot;</span> <span class="op">%notin%</span><span class="st"> </span><span class="kw">c</span>(<span class="st">&quot;a&quot;</span>,<span class="st">&quot;c&quot;</span>), <span class="op">!</span><span class="st">&quot;b&quot;</span> <span class="op">%!in%</span><span class="st"> </span><span class="kw">c</span>(<span class="st">&quot;a&quot;</span>,<span class="st">&quot;c&quot;</span>))</a>
<a class="sourceLine" id="cb9-6" data-line-number="6"><span class="co">#&gt; [1] TRUE</span></a></code></pre></div>
</div>
</div>
<div id="gcp-functions" class="section level2">
<h2>GCP functions</h2>
<div id="bduk_bq" class="section level3">
<h3>bduk_bq()</h3>
<p>THis function provides a shorthand for writing queries directly to bigquery within R. The input to this function must be a valid query, and the name of the project you are quering from within GCP. To run such a query a .json billing key must be stored on your machine. By default, this function will assume the key is the project name with &quot;_bigquery.json&quot; at the end. If this is not the case, the key name will need to be specified. By default, this function will assume the key is stored in the current working directory or project. If this is not the case, the key must be specified. This function also sets ‘bigint’ to integer64, allowing R to load in integer64 numbers (eg. UPRNs), but it is recommended that you use ‘CAST(VARIABLE as NUMERIC) as VARIABLE’ when running your queries, or converting these to numeric once they have been read in.</p>
<div class="sourceCode" id="cb10"><pre class="sourceCode r"><code class="sourceCode r"><a class="sourceLine" id="cb10-1" data-line-number="1">sql=<span class="st">&quot;SELECT pcds,Rurality FROM `dcms-datalake-staging.GEO_ONS.ONS_RURALITY` LIMIT 1 &quot;</span></a>
<a class="sourceLine" id="cb10-2" data-line-number="2"></a>
<a class="sourceLine" id="cb10-3" data-line-number="3"><span class="kw">setwd</span>(<span class="st">&quot;/home/dcms/keys&quot;</span>)</a>
<a class="sourceLine" id="cb10-4" data-line-number="4"></a>
<a class="sourceLine" id="cb10-5" data-line-number="5"><span class="kw">bduk_bq</span>(</a>
<a class="sourceLine" id="cb10-6" data-line-number="6">      <span class="dt">sql=</span>sql,</a>
<a class="sourceLine" id="cb10-7" data-line-number="7">      <span class="dt">project=</span><span class="st">&quot;dcms-datalake-staging&quot;</span></a>
<a class="sourceLine" id="cb10-8" data-line-number="8">    )</a>
<a class="sourceLine" id="cb10-9" data-line-number="9"><span class="co">#&gt; Complete</span></a>
<a class="sourceLine" id="cb10-10" data-line-number="10"><span class="co">#&gt; Billed: 0 B</span></a>
<a class="sourceLine" id="cb10-11" data-line-number="11"><span class="co">#&gt; Downloading 1 rows in 1 pages.</span></a>
<a class="sourceLine" id="cb10-12" data-line-number="12"><span class="co">#&gt; </span></a>
<a class="sourceLine" id="cb10-13" data-line-number="13">Parsing [<span class="op">==</span><span class="er">====================================================================</span>] ETA<span class="op">:</span><span class="st">  </span>0s</a>
<a class="sourceLine" id="cb10-14" data-line-number="14">                                                                                         </a>
<a class="sourceLine" id="cb10-15" data-line-number="15"><span class="co">#&gt; # A tibble: 1 x 2</span></a>
<a class="sourceLine" id="cb10-16" data-line-number="16"><span class="co">#&gt;   pcds  Rurality</span></a>
<a class="sourceLine" id="cb10-17" data-line-number="17"><span class="co">#&gt;   &lt;chr&gt; &lt;chr&gt;   </span></a>
<a class="sourceLine" id="cb10-18" data-line-number="18"><span class="co">#&gt; 1 pcds  Rurality</span></a>
<a class="sourceLine" id="cb10-19" data-line-number="19"></a>
<a class="sourceLine" id="cb10-20" data-line-number="20"><span class="kw">bduk_bq</span>(</a>
<a class="sourceLine" id="cb10-21" data-line-number="21">      <span class="dt">sql=</span>sql,</a>
<a class="sourceLine" id="cb10-22" data-line-number="22">      <span class="dt">project=</span><span class="st">&quot;dcms-datalake-staging&quot;</span>,</a>
<a class="sourceLine" id="cb10-23" data-line-number="23">      <span class="dt">key=</span><span class="st">&quot;dcms-datalake-staging_bigquery.json&quot;</span></a>
<a class="sourceLine" id="cb10-24" data-line-number="24">    )</a>
<a class="sourceLine" id="cb10-25" data-line-number="25"><span class="co">#&gt; Complete</span></a>
<a class="sourceLine" id="cb10-26" data-line-number="26"><span class="co">#&gt; Billed: 0 B</span></a>
<a class="sourceLine" id="cb10-27" data-line-number="27"><span class="co">#&gt; Downloading 1 rows in 1 pages.</span></a>
<a class="sourceLine" id="cb10-28" data-line-number="28"><span class="co">#&gt; </span></a>
<a class="sourceLine" id="cb10-29" data-line-number="29">Parsing [<span class="op">==</span><span class="er">====================================================================</span>] ETA<span class="op">:</span><span class="st">  </span>0s</a>
<a class="sourceLine" id="cb10-30" data-line-number="30">                                                                                         </a>
<a class="sourceLine" id="cb10-31" data-line-number="31"><span class="co">#&gt; # A tibble: 1 x 2</span></a>
<a class="sourceLine" id="cb10-32" data-line-number="32"><span class="co">#&gt;   pcds  Rurality</span></a>
<a class="sourceLine" id="cb10-33" data-line-number="33"><span class="co">#&gt;   &lt;chr&gt; &lt;chr&gt;   </span></a>
<a class="sourceLine" id="cb10-34" data-line-number="34"><span class="co">#&gt; 1 pcds  Rurality</span></a>
<a class="sourceLine" id="cb10-35" data-line-number="35"></a>
<a class="sourceLine" id="cb10-36" data-line-number="36"><span class="kw">bduk_bq</span>(</a>
<a class="sourceLine" id="cb10-37" data-line-number="37">      <span class="dt">sql=</span>sql,</a>
<a class="sourceLine" id="cb10-38" data-line-number="38">      <span class="dt">project=</span><span class="st">&quot;dcms-datalake-staging&quot;</span>,</a>
<a class="sourceLine" id="cb10-39" data-line-number="39">      <span class="dt">keypath=</span><span class="st">&quot;/home/dcms/keys&quot;</span></a>
<a class="sourceLine" id="cb10-40" data-line-number="40">    )</a>
<a class="sourceLine" id="cb10-41" data-line-number="41"><span class="co">#&gt; Complete</span></a>
<a class="sourceLine" id="cb10-42" data-line-number="42"><span class="co">#&gt; Billed: 0 B</span></a>
<a class="sourceLine" id="cb10-43" data-line-number="43"><span class="co">#&gt; Downloading 1 rows in 1 pages.</span></a>
<a class="sourceLine" id="cb10-44" data-line-number="44"><span class="co">#&gt; </span></a>
<a class="sourceLine" id="cb10-45" data-line-number="45">Parsing [<span class="op">==</span><span class="er">====================================================================</span>] ETA<span class="op">:</span><span class="st">  </span>0s</a>
<a class="sourceLine" id="cb10-46" data-line-number="46">                                                                                         </a>
<a class="sourceLine" id="cb10-47" data-line-number="47"><span class="co">#&gt; # A tibble: 1 x 2</span></a>
<a class="sourceLine" id="cb10-48" data-line-number="48"><span class="co">#&gt;   pcds  Rurality</span></a>
<a class="sourceLine" id="cb10-49" data-line-number="49"><span class="co">#&gt;   &lt;chr&gt; &lt;chr&gt;   </span></a>
<a class="sourceLine" id="cb10-50" data-line-number="50"><span class="co">#&gt; 1 pcds  Rurality</span></a></code></pre></div>
<div class="sourceCode" id="cb11"><pre class="sourceCode r"><code class="sourceCode r"><a class="sourceLine" id="cb11-1" data-line-number="1">sql=<span class="st">&quot;SELECT pcds,Rurality FROM `dcms-datalake-staging.GEO_ONS.ONS_RURALITY` LIMIT 1 &quot;</span></a>
<a class="sourceLine" id="cb11-2" data-line-number="2"></a>
<a class="sourceLine" id="cb11-3" data-line-number="3"><span class="co">#No key in this directory</span></a>
<a class="sourceLine" id="cb11-4" data-line-number="4"><span class="kw">setwd</span>(<span class="st">&quot;/home/dcms/&quot;</span>)</a>
<a class="sourceLine" id="cb11-5" data-line-number="5"></a>
<a class="sourceLine" id="cb11-6" data-line-number="6"><span class="kw">bduk_bq</span>(</a>
<a class="sourceLine" id="cb11-7" data-line-number="7">      <span class="dt">sql=</span>sql,</a>
<a class="sourceLine" id="cb11-8" data-line-number="8">      <span class="dt">project=</span><span class="st">&quot;dcms-datalake-staging&quot;</span></a>
<a class="sourceLine" id="cb11-9" data-line-number="9">    )</a>
<a class="sourceLine" id="cb11-10" data-line-number="10"><span class="co">#&gt; There is no json key saved in this directory. Please copy the file 'dcms-datalake-staging_bigquery.json' into the project or directory you are working within. The file can likely be found in ~/home/keys. If you have not made this folder, please contact the BDUK data and modelling team for additional support.</span></a></code></pre></div>
</div>
</div>
<div id="spatial-functions" class="section level2">
<h2>Spatial functions</h2>
<div id="geojson_to_sf" class="section level3">
<h3>geojson_to_sf()</h3>
<p>Data in BigQuery is frequently stored in geojson format. This function provides a cimple shorthand to input a data frame or tibble that contains a geojson column (eg. a table read from BigQuery) as easily convert it to a simple feature. The inputs to this function are the data frame or tibble, and the column name of the geojson column as a string.</p>
<div class="sourceCode" id="cb12"><pre class="sourceCode r"><code class="sourceCode r"><a class="sourceLine" id="cb12-1" data-line-number="1">bq_table&lt;-<span class="kw">bduk_bq</span>(</a>
<a class="sourceLine" id="cb12-2" data-line-number="2">          <span class="dt">sql=</span><span class="st">&quot;SELECT * FROM dcms-datalake-staging.GEO_ONS.shp_LA LIMIT 1&quot;</span> ,</a>
<a class="sourceLine" id="cb12-3" data-line-number="3">          <span class="dt">project=</span><span class="st">&quot;dcms-datalake-staging&quot;</span>,</a>
<a class="sourceLine" id="cb12-4" data-line-number="4">          <span class="dt">keypath=</span><span class="st">&quot;/home/dcms/keys&quot;</span>)</a>
<a class="sourceLine" id="cb12-5" data-line-number="5"><span class="co">#&gt; Complete</span></a>
<a class="sourceLine" id="cb12-6" data-line-number="6"><span class="co">#&gt; Billed: 0 B</span></a>
<a class="sourceLine" id="cb12-7" data-line-number="7"><span class="co">#&gt; Downloading 1 rows in 1 pages.</span></a>
<a class="sourceLine" id="cb12-8" data-line-number="8"><span class="co">#&gt; </span></a>
<a class="sourceLine" id="cb12-9" data-line-number="9">Parsing [<span class="op">==</span><span class="er">====================================================================</span>] ETA<span class="op">:</span><span class="st">  </span>0s</a>
<a class="sourceLine" id="cb12-10" data-line-number="10">                                                                                         </a>
<a class="sourceLine" id="cb12-11" data-line-number="11"></a>
<a class="sourceLine" id="cb12-12" data-line-number="12"><span class="kw">geojson_to_sf</span>(</a>
<a class="sourceLine" id="cb12-13" data-line-number="13">        <span class="dt">data=</span>bq_table,</a>
<a class="sourceLine" id="cb12-14" data-line-number="14">        <span class="dt">geojson_colname =</span> <span class="st">&quot;geom&quot;</span></a>
<a class="sourceLine" id="cb12-15" data-line-number="15">      )</a>
<a class="sourceLine" id="cb12-16" data-line-number="16"><span class="co">#&gt; Simple feature collection with 1 feature and 10 fields</span></a>
<a class="sourceLine" id="cb12-17" data-line-number="17"><span class="co">#&gt; geometry type:  POLYGON</span></a>
<a class="sourceLine" id="cb12-18" data-line-number="18"><span class="co">#&gt; dimension:      XY</span></a>
<a class="sourceLine" id="cb12-19" data-line-number="19"><span class="co">#&gt; bbox:           xmin: 440052.7 ymin: 525456.8 xmax: 454455 ymax: 537152</span></a>
<a class="sourceLine" id="cb12-20" data-line-number="20"><span class="co">#&gt; CRS:            4326</span></a>
<a class="sourceLine" id="cb12-21" data-line-number="21"><span class="co">#&gt; Warning in st_is_longlat(x): bounding box has potentially an invalid value range for</span></a>
<a class="sourceLine" id="cb12-22" data-line-number="22"><span class="co">#&gt; longlat data</span></a>
<a class="sourceLine" id="cb12-23" data-line-number="23"><span class="co">#&gt; # A tibble: 1 x 11</span></a>
<a class="sourceLine" id="cb12-24" data-line-number="24"><span class="co">#&gt;                        geom OBJECTID LAD20CD LAD20NM LAD20NMW  BNG_E  BNG_N  LONG   LAT</span></a>
<a class="sourceLine" id="cb12-25" data-line-number="25"><span class="co">#&gt;               &lt;POLYGON [°]&gt;  &lt;int64&gt; &lt;chr&gt;   &lt;chr&gt;   &lt;chr&gt;    &lt;int6&gt; &lt;int6&gt; &lt;dbl&gt; &lt;dbl&gt;</span></a>
<a class="sourceLine" id="cb12-26" data-line-number="26"><span class="co">#&gt; 1 ((448973.6 536745.3, 448…        1 E06000… Hartle… &lt;NA&gt;     447160 531474 -1.27  54.7</span></a>
<a class="sourceLine" id="cb12-27" data-line-number="27"><span class="co">#&gt; # … with 2 more variables: Shape__Are &lt;dbl&gt;, Shape__Len &lt;dbl&gt;</span></a></code></pre></div>
</div>
<div id="make_sf" class="section level3">
<h3>make_sf()</h3>
<p>This function provides an easy shorthand to take any dataframe with coordinate columns, and convert it into a simple feature object. The inputs to this function are the data frame or tibble, the x and y column names, both as strings, and the coordinate system number. Coordinate reference system codes can be found at <a href="https://spatialreference.org/">https://spatialreference.org/</a>. This mostly serves as a wrapped to sf::st_as_sf(), but the defaults for this are set as latitude and longitude. Columns containing the string “lon” or “lat” in any case being used as the x_colname and y_colname respectively, and the coordinate reference system set to 4326. If multiple columns contain these strings, the function will return the data frame unchanged and produce an error message prompting you to specify the column names manually.</p>
<div class="sourceCode" id="cb13"><pre class="sourceCode r"><code class="sourceCode r"><a class="sourceLine" id="cb13-1" data-line-number="1"><span class="kw">make_sf</span>(</a>
<a class="sourceLine" id="cb13-2" data-line-number="2">       <span class="dt">data=</span><span class="kw">data.frame</span>(</a>
<a class="sourceLine" id="cb13-3" data-line-number="3">          <span class="st">&quot;Longitude&quot;</span>=<span class="kw">c</span>(<span class="dv">1</span>,<span class="dv">2</span>,<span class="dv">3</span>),</a>
<a class="sourceLine" id="cb13-4" data-line-number="4">          <span class="st">&quot;Latitude&quot;</span>=<span class="kw">c</span>(<span class="dv">51</span>,<span class="dv">52</span>,<span class="dv">53</span>)</a>
<a class="sourceLine" id="cb13-5" data-line-number="5">          ),</a>
<a class="sourceLine" id="cb13-6" data-line-number="6">       <span class="dt">x_colname=</span><span class="st">&quot;Longitude&quot;</span>,</a>
<a class="sourceLine" id="cb13-7" data-line-number="7">       <span class="dt">y_colname=</span><span class="st">&quot;Latitude&quot;</span>,</a>
<a class="sourceLine" id="cb13-8" data-line-number="8">       <span class="dt">crs=</span><span class="dv">4326</span></a>
<a class="sourceLine" id="cb13-9" data-line-number="9">    )</a>
<a class="sourceLine" id="cb13-10" data-line-number="10"><span class="co">#&gt; Simple feature collection with 3 features and 0 fields</span></a>
<a class="sourceLine" id="cb13-11" data-line-number="11"><span class="co">#&gt; geometry type:  POINT</span></a>
<a class="sourceLine" id="cb13-12" data-line-number="12"><span class="co">#&gt; dimension:      XY</span></a>
<a class="sourceLine" id="cb13-13" data-line-number="13"><span class="co">#&gt; bbox:           xmin: 1 ymin: 51 xmax: 3 ymax: 53</span></a>
<a class="sourceLine" id="cb13-14" data-line-number="14"><span class="co">#&gt; CRS:            EPSG:4326</span></a>
<a class="sourceLine" id="cb13-15" data-line-number="15"><span class="co">#&gt;       geometry</span></a>
<a class="sourceLine" id="cb13-16" data-line-number="16"><span class="co">#&gt; 1 POINT (1 51)</span></a>
<a class="sourceLine" id="cb13-17" data-line-number="17"><span class="co">#&gt; 2 POINT (2 52)</span></a>
<a class="sourceLine" id="cb13-18" data-line-number="18"><span class="co">#&gt; 3 POINT (3 53)</span></a>
<a class="sourceLine" id="cb13-19" data-line-number="19"></a>
<a class="sourceLine" id="cb13-20" data-line-number="20"><span class="kw">make_sf</span>(</a>
<a class="sourceLine" id="cb13-21" data-line-number="21">       <span class="dt">data=</span><span class="kw">data.frame</span>(</a>
<a class="sourceLine" id="cb13-22" data-line-number="22">          <span class="st">&quot;Longitude&quot;</span>=<span class="kw">c</span>(<span class="dv">1</span>,<span class="dv">2</span>,<span class="dv">3</span>),</a>
<a class="sourceLine" id="cb13-23" data-line-number="23">          <span class="st">&quot;Latitude&quot;</span>=<span class="kw">c</span>(<span class="dv">51</span>,<span class="dv">52</span>,<span class="dv">53</span>)</a>
<a class="sourceLine" id="cb13-24" data-line-number="24">          )</a>
<a class="sourceLine" id="cb13-25" data-line-number="25">    )</a>
<a class="sourceLine" id="cb13-26" data-line-number="26"><span class="co">#&gt; Simple feature collection with 3 features and 0 fields</span></a>
<a class="sourceLine" id="cb13-27" data-line-number="27"><span class="co">#&gt; geometry type:  POINT</span></a>
<a class="sourceLine" id="cb13-28" data-line-number="28"><span class="co">#&gt; dimension:      XY</span></a>
<a class="sourceLine" id="cb13-29" data-line-number="29"><span class="co">#&gt; bbox:           xmin: 1 ymin: 51 xmax: 3 ymax: 53</span></a>
<a class="sourceLine" id="cb13-30" data-line-number="30"><span class="co">#&gt; CRS:            EPSG:4326</span></a>
<a class="sourceLine" id="cb13-31" data-line-number="31"><span class="co">#&gt;       geometry</span></a>
<a class="sourceLine" id="cb13-32" data-line-number="32"><span class="co">#&gt; 1 POINT (1 51)</span></a>
<a class="sourceLine" id="cb13-33" data-line-number="33"><span class="co">#&gt; 2 POINT (2 52)</span></a>
<a class="sourceLine" id="cb13-34" data-line-number="34"><span class="co">#&gt; 3 POINT (3 53)</span></a>
<a class="sourceLine" id="cb13-35" data-line-number="35"></a>
<a class="sourceLine" id="cb13-36" data-line-number="36"><span class="kw">make_sf</span>(</a>
<a class="sourceLine" id="cb13-37" data-line-number="37">      <span class="dt">data=</span><span class="kw">data.frame</span>(</a>
<a class="sourceLine" id="cb13-38" data-line-number="38">        <span class="st">&quot;Longitude_1&quot;</span>=<span class="kw">c</span>(<span class="dv">1</span>,<span class="dv">2</span>,<span class="dv">3</span>),</a>
<a class="sourceLine" id="cb13-39" data-line-number="39">        <span class="st">&quot;Longitude_2&quot;</span>=<span class="kw">c</span>(<span class="dv">11</span>,<span class="dv">12</span>,<span class="dv">14</span>),</a>
<a class="sourceLine" id="cb13-40" data-line-number="40">        <span class="st">&quot;Latitude&quot;</span>=<span class="kw">c</span>(<span class="dv">51</span>,<span class="dv">52</span>,<span class="dv">53</span>)</a>
<a class="sourceLine" id="cb13-41" data-line-number="41">      )</a>
<a class="sourceLine" id="cb13-42" data-line-number="42">    )</a>
<a class="sourceLine" id="cb13-43" data-line-number="43"><span class="co">#&gt; Error: Multiple columns contain 'lon', please specify the x_colname.</span></a>
<a class="sourceLine" id="cb13-44" data-line-number="44"><span class="co">#&gt;   Longitude_1 Longitude_2 Latitude</span></a>
<a class="sourceLine" id="cb13-45" data-line-number="45"><span class="co">#&gt; 1           1          11       51</span></a>
<a class="sourceLine" id="cb13-46" data-line-number="46"><span class="co">#&gt; 2           2          12       52</span></a>
<a class="sourceLine" id="cb13-47" data-line-number="47"><span class="co">#&gt; 3           3          14       53</span></a></code></pre></div>
</div>
</div>
<div id="shiny-functions" class="section level2">
<h2>Shiny functions</h2>
<div id="cleargroups" class="section level3">
<h3>clearGroups()</h3>
<p>A function to clear all groups from a leaflet object from within a shiny application. The prevents having to run <code>clearGroup(&quot;groupname&quot;)</code> for every group. The input to this is the name of the map, and then the groups wanting to be cleared as comma seperated strings.</p>
<pre><code>library(shiny)
library(leaflet)
library(dplyr)

points_1&lt;-data.frame(&quot;lng&quot;=c(-2,-1,0),&quot;lat&quot;=c(51,52,53))
points_2&lt;-data.frame(&quot;lng&quot;=c(-2.1,-1.1,-0.1),&quot;lat&quot;=c(51,52,53))

ui&lt;-fluidPage(
  fluidRow(
    actionButton(&quot;addgroups&quot;, &quot;Add Groups&quot;),
    actionButton(&quot;cleargroups&quot;, &quot;Clear Groups&quot;),
    leafletOutput(&quot;mymap&quot;)
  )
)

server&lt;-function(input,output,session){

  output$mymap &lt;- renderLeaflet({
    leaflet(options = leafletOptions(preferCanvas = TRUE)) %&gt;%
      addTiles(options = tileOptions(opacity = 0.8), group = &quot;Open Street Map&quot;) %&gt;%
      setView(lng = -1, lat = 52, zoom = 7)
  })

  observeEvent(input$addgroups,{
    leafletProxy(&quot;mymap&quot;)%&gt;%
      addCircles(data=points_1,lng=~lng,lat=~lat,color=&quot;Red&quot;,group=&quot;Group 1&quot;) %&gt;%
      addCircles(data=points_2,lng=~lng,lat=~lat,color=&quot;Blue&quot;,group=&quot;Group 2&quot;)
  })

  observeEvent(input$cleargroups,{
    clearGroups(map=&quot;mymap&quot;,&quot;Group 1&quot;,&quot;Group 2&quot;)
  })
}

shinyApp(ui, server)</code></pre>
</div>
<div id="radiotooltip" class="section level3">
<h3>radioTooltip()</h3>
<p>By default, shiny and shinyBS together allow us to add popup tooltips to shiny buttons and input fields. However, this tooltip will apply to all parts of the input fiels. For radio buttons and groups of checkboxes, this can be problematic. This function allows us to add a tooltip to specific parts of a radio button.</p>
<pre><code>library(shiny)
library(leaflet)
library(dplyr)

ui&lt;-fluidPage(
  fluidRow(
    radioButtons(
      &quot;radio&quot;,
      &quot;Radio Button&quot;,
      choices=c(&quot;Tooltip shows on mouseover here&quot;,
                &quot;Tooltip shows on mouseover here as well&quot;,
                &quot;Tooltip does not show on mouseover here&quot;)
                ),
    radioTooltip(
      id=&quot;radio&quot;,
      title=&quot;Tooltip message appears like this&quot;,
      choice=c(
        &quot;Tooltip shows on mouseover here&quot;,
        &quot;Tooltip shows on mouseover here as well&quot;
      ),
      placement=&quot;right&quot;,
      trigger=&quot;hover&quot;
    )
  )
)

server&lt;-function(input,output,session){}

shinyApp(ui, server)
</code></pre>
</div>
</div>



<!-- code folding -->


<!-- dynamically load mathjax for compatibility with self-contained -->
<script>
  (function () {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src  = "https://mathjax.rstudio.com/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML";
    document.getElementsByTagName("head")[0].appendChild(script);
  })();
</script>

</body>
</html>
