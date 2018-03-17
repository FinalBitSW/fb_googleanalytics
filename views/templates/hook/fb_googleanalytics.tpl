{*
 * Copyright © 2017 FinalBit Solution. All rights reserved.
 * http://www.finalbit.ch
 * See LICENSE.txt for license details.
 *}

{literal}
<script type="text/javascript">
	(window.gaDevIds=window.gaDevIds||[]).push('d6YPbH');
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
{/literal}
    {if $gaCrossdomainEnabled}
        ga('create', '{$gaAccountId|escape:'htmlall':'UTF-8'}', 'auto', {literal}{'allowLinker': true}{/literal});
        ga('require', 'linker');
        ga('linker:autoLink', [
        {foreach from=$shops item=shop}
            {if $shop.id_shop != $currentShopId}
            {if $useSecureMode}'{$shop.domain_ssl|escape:'htmlall':'UTF-8'}'{else}'{$shop.domain|escape:'htmlall':'UTF-8'}'{/if},
            {/if}
        {/foreach}
        ]);
    {else}
        ga('create', '{$gaAccountId|escape:'htmlall':'UTF-8'}', 'auto');
    {/if}
    {if $userId && !$backOffice}
        ga('set', 'userId', '{$userId|escape:'htmlall':'UTF-8'}');
    {/if}
    {if $backOffice}
        ga('set', 'nonInteraction', true);
    {/if}
{literal}
    ga('require', 'ec');
</script>
{/literal}
