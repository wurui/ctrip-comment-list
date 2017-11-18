<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.ctrip-comment-list">
    	<xsl:param name="detail_link">#detail</xsl:param>
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-ctrip-comment-list" ox-mod="ctrip-comment-list">
        	<xsl:variable name="score" select="data/comment-gist/score"/>
            <h3>
                <a class="bt-more" href="{$detail_link}">查看全部 &gt;</a>
                游友点评
            </h3>
            <div class="comment-gist">
            	<p class="score">
            		<span class="score-bar">
						<nobr class="background">
			    			<span class="foreground" style="width:{format-number($score div 5,'##%')};">
			    				<i></i><i></i><i></i><i></i><i></i>
			    			</span>
			    			<i></i><i></i><i></i><i></i><i></i>
			    		</nobr>
					</span>
            		<span class="score-number">
            			<xsl:value-of select="$score"/>分
            		</span>
            		<span class="comment-count">
            			<xsl:value-of select="data/comment-gist/count"/>条点评
            		</span>
            	</p>
            	<div class="comment-tags">
            		<xsl:for-each select="data/comment-gist/tags/i">
            			<em>
            				<xsl:value-of select="."/>
            			</em>
            		</xsl:for-each>
            	</div>
            </div>
            <ul class="list">
            	<xsl:for-each select="data/comment-list/i">
            		<li>
            			<i class="stamp"><span>精华</span></i>
            			<a href="{href}">
            			<div class="user">
            				<img src="{avatar}" class="avatar"/>
            				<b class="user_name">
            					<xsl:value-of select="user"/>
            				</b>
            				<xsl:if test="user_rank &gt; 0">
	            				<span class="user_rank"><xsl:value-of select="user_rank"/></span>
	            			</xsl:if>
	            			<xsl:if test="user_tag !='' ">
	            				<span class="user_tag"><xsl:value-of select="user_tag"/></span>
	            			</xsl:if>
	            			<br/>
	            			<span class="score-bar">
								<nobr class="background">
					    			<span class="foreground" style="width:{format-number(score div 5,'##%')};">
					    				<i></i><i></i><i></i><i></i><i></i>
					    			</span>
					    			<i></i><i></i><i></i><i></i><i></i>
					    		</nobr>
							</span>
            			</div>
            			<div class="text">
            				<xsl:value-of select="text"/>
            			</div>
            			<div class="imgs show-imgcount-{count(imgs/i) &gt; 4 }" data-count="{count(imgs/i)}">
            				<xsl:for-each select="imgs/i[position() &lt; 5]">
            					<img src="https://a.oxm1.cc/img/blank.png" style="background-image:url({.})"/>
            				</xsl:for-each>
            			</div>
            			</a>
            		</li>
            	</xsl:for-each>
            </ul>
            <xsl:if test="data/comment-gist/count &gt; 2">
	            <div class="bottom-button">
	            	<a href="{$detail_link}">查看全部<xsl:value-of select="data/comment-gist/count"/>条点评</a>
	            </div>
	        </xsl:if>
        </div>
    </xsl:template>
</xsl:stylesheet>
