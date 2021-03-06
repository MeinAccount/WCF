<input type="hidden" name="captchaQuestion" value="{$captchaQuestion}" />

{if !$captchaQuestionAnswered}
	<fieldset>
		<legend>{lang}wcf.captcha.question.captcha{/lang}</legend>
		<small>{lang}wcf.captcha.question.captcha.description{/lang}</small>
		
		<dl{if (($errorType|isset && $errorType|is_array && $errorType[captchaAnswer]|isset) || ($errorField|isset && $errorField == 'captchaAnswer'))} class="formError"{/if}>
			<dt><label for="captchaAnswer">{lang}{$captchaQuestionObject->question}{/lang}</label></dt>
			<dd>
				<input type="text" id="captchaAnswer" name="captchaAnswer" class="medium" />
				{if (($errorType|isset && $errorType|is_array && $errorType[captchaAnswer]|isset) || ($errorField|isset && $errorField == 'captchaAnswer'))}
					{if $errorType|is_array && $errorType[captchaAnswer]|isset}
						{assign var='__errorType' value=$errorType[captchaAnswer]}
					{else}
						{assign var='__errorType' value=$errorType}
					{/if}
					
					{if $__errorType == 'empty'}
						<small class="innerError">{lang}wcf.global.form.error.empty{/lang}</small>
					{else}
						<small class="innerError">{lang}wcf.captcha.question.answer.error.{$__errorType}{/lang}</small>
					{/if}
				{/if}
			</dd>
		</dl>
	</fieldset>
	
	{if !$ajaxCaptcha|empty}
		<script data-relocate="true">
			//<![CDATA[
			$(function() {
				WCF.System.Captcha.addCallback('{$captchaID}', function() {
					return {
						captchaAnswer: $('#captchaAnswer').val(),
						captchaQuestion: '{$captchaQuestion}'
					};
				});
			});
			//]]>
		</script>
	{/if}
{/if}
