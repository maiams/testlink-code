{* 
TestLink Open Source Project - http://testlink.sourceforge.net/
Purpose: show results for requirement specification search.
*}

{include file="inc_head.tpl" openHead='yes'}
<script language="JavaScript" src="gui/javascript/expandAndCollapseFunctions.js" type="text/javascript"></script>
{include file="inc_ext_js.tpl" css_only=1}

</head>

{assign var=this_template_dir value=$smarty.template|dirname}
{lang_get var='labels' 
          s='no_records_found,other_versions,version'}

<body onLoad="viewElement(document.getElementById('other_versions'),false)">
<h1 class="title">{$gui->pageTitle}</h1>

<div class="workBack">
{if $gui->warning_msg == ''}
    {if $gui->resultSet}
        <table class="simple">
        	{foreach from=$gui->resultSet item=req_spec}
	            {assign var="id" value=$req_spec.id}
	            <tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">       
	            <td>
	            	{if $gui->path_info[$id] != ''}
	        			{$gui->path_info[$id]|escape}/
	        		{/if}
	        		<a href="lib/requirements/reqSpecView.php?item=req_spec&req_spec_id={$id}">
	        		{$req_spec.name|escape}</a>
	            </td>
	        	  </tr>
	        {/foreach}
        </table>
    {else}
        	{$labels.no_records_found}
    {/if}
{else}
    {$gui->warning_msg}
{/if}   
</div>
</body>
</html>
