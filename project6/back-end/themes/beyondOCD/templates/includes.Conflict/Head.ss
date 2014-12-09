<!DOCTYPE html>
<html class="no-js" lang="$ContentLocale">
<head>
<meta charset="utf-8">
<base href="$BaseHref"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>$SiteConfig.Tagline</title>
$MetaTags(false)
<meta name="HandheldFriendly" content="True">
<meta name="MobileOptimized" content="320">
<!--
<meta name="viewport" content="width=device-width">
-->
<meta http-equiv="cleartype" content="on">
<link rel="shortcut icon" href="{$ThemeDir}/favicon.ico">
<meta property="og:title" content="$MetaTitle" />
<meta property="og:type" content="Website" />
<meta property="og:image" content="<% if ClassName == 'BlogHolder' || ClassName == 'BlogEntry' %>{$ProtocolAndHost}$SortedImages.First.SetWidth(630).Link<% else %>$BaseHref{$ThemeDir}/img/logo-200x200.png<% end_if %>" />
<meta property="og:url" content="$AbsoluteLink" />
<meta property="og:site_name" content="$SiteConfig.Title" />
<meta property="og:description" content="$SiteConfig.Tagline" />
</head>
<body id="$ClassName" <% if checkForSession %> class="sessionActive" <% end_if %>>