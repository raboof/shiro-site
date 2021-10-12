<!DOCTYPE html>
<!--
   Licensed to the Apache Software Foundation (ASF) under one or more
   contributor license agreements.  See the NOTICE file distributed with
   this work for additional information regarding copyright ownership.
   The ASF licenses this file to You under the Apache License, Version 2.0
   (the "License"); you may not use this file except in compliance with
   the License.  You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-  2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
-->
<#import "macros/versions.ftl" as versions>
<#import "macros/dependencies.ftl" as dependencies>
<#import "macros/lend-a-hand.ftl" as lendahand>
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <#if (content.title)?? && (content.title)?contains("|")>
    <#-- The page has a full custom title, render it directly: -->
      <#assign ftltitle="${content.title}" />
    <#elseif (content.title)??>
    <#-- standard title, append the project name appended for SEO: -->
      <#assign ftltitle="${content.title} | Apache Shiro" />
    <#else>
    <#-- No title found in the page metadata, set the default: -->
      <#assign ftltitle="Apache Shiro | Simple. Java. Security." />
    </#if>
    <title>${ftltitle}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <#if (content.description)??>
    <meta name="description" content="${content.description}">
    <meta property="og:description" content="${content.description}">
    <#else>
    <meta name="description" content="Apache Shiro is a powerful and easy-to-use Java security framework that performs authentication, authorization, cryptography, and session management.">
    <#-- leave out og:description, so it will fill from the body. -->
    </#if>
    <#if (content.type == "post") && (content.author)??>
    <meta name="author" content="${content.author}">
    </#if>
    <#if (content.tags)??>
    <meta name="keywords" content='${(content.tags)?join(",")}'>
    </#if>
    <meta name="generator" content="JBake">
    <meta name="google-site-verification" content="QIax6uT5UX3enoU0G8Pz2pXbQ45KaQuHZ3nCh9V27mw">
    <meta name="google-site-verification" content="ecFap6dWJgS_GCCtxmJQJ_nFYQhM6EgSpBPZDU7xsCE">
    <meta name="google-site-verification" content="gBTYOG8lMfNb_jrWrH3kFbudpEs_WrAJ2lb2-zLRaso"/>
    <meta name="msvalidate.01" content="0B57EB46CBFAD8FD45008D2DB6B6C68C">

    <meta property="og:title" content="${ftltitle}"/>
    <#switch (content.type)!"">
      <#case "post">
        <#if (content.date)??>
    <meta property="article:published_time" content="${content.date?date?string.iso}"/>
        </#if>
      <#-- fall through -->
      <#case "page">
    <meta property="og:type" content="article"/>
        <#if (content.date)??>
    <meta property="article:modification_time" content="${content.date?date?string.iso}"/>
        </#if>
        <#if (content.published_date)??>
    <meta property="article:published_time" content="${content.published_date?date?string.iso}"/>
        </#if>
        <#break>
      <#default>
    <meta property="og:type" content="website"/>
    </#switch>
    <#if (content.tags)??>
    <meta property="article:tag" content='${content.tags?join(",")}'/>
    </#if>
    <meta property="og:locale" content="en_US" />
    <#if content?? &&  (content.type)?? && (content.type) == "page">
    <meta property="og:url" content='${config.site_host}/${content.uri}'/>
    <#else></#if>
    <#-- custom featured image if it exists or default featured image. -->
    <#if (content.featuredimage)?? >
    <meta property="og:image" content="${content.rootpath!""}${content.featuredimage}"/>
      <#if (content.featuredimagewidth)??>
    <meta property="og:image:width" content="${content.featuredimagewidth}"/>
      </#if>
      <#if (content.featuredimageheight)??>
    <meta property="og:image:height" content="${content.featuredimageheight}"/>
      </#if>
    <#else>
    <meta property="og:image" content='${content.rootpath!""}img/shiro-featured-image.png'/>
    <meta property="og:image:width" content='1200'/>
    <meta property="og:image:height" content='628'/>
    </#if>
    <meta property="og:site_name" content="Apache Shiro"/>

    <!-- Le styles -->
    <link href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>css/bootstrap.min.css" rel="stylesheet">
    <link href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>bootstrap-icons-1.5.0/bootstrap-icons.css" rel="stylesheet">
    <link href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>css/asciidoctor.css" rel="stylesheet">
    <link href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>css/base.css" rel="stylesheet">
    <link href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>highlight.js-11.2.0/styles/default.min.css" rel="stylesheet">
    <link href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>css/gh-pages/gh-fork-ribbon.css" rel="stylesheet"/>

    <!-- Fav and touch icons -->
    <!--<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">-->
    <link rel="shortcut icon" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>favicon.ico">
  </head>
  <body>
    <div id="top-bar"></div>
    <a class="github-fork-ribbon right-top" href="https://github.com/apache/shiro" title="Fork me on GitHub">Fork me on GitHub</a>

    <div id="wrap"><#-- closed in footer -->

      <div class="masthead">
        <p class="lead">
          <a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>index.html"><img src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>img/apache-shiro-logo.png" style="height:100px; width:auto; vertical-align: bottom; margin-top: 20px;" alt="Apache Shiro Logo"></a>
          <span class="tagline">Simple. Java. Security.</span>
          <a class="pull-right" href="https://www.apache.org/events/current-event.html">
            <img style="padding-top: 8px" src="https://www.apache.org/events/current-event-125x125.png" alt="Apache Software Foundation Event Banner"/>
          </a>
        </p>
      </div>

<#include "menu.ftl">
