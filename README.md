installwebservices
==================

Installing webservices (Apache2, PHP5, MySQL) for Ubuntu

<pre>
<code>git clone git@github.com:thomasstr/installwebservices.git
cd installwebservices
chmod a+x install-ubuntu-12.04.sh or
chmod a+x install-ubuntu-12.10.sh
sudo ./install-ubuntu-12.04.sh or
sudo ./install-ubuntu-12.10.sh</code>
</pre>


<h3>For Ubuntu 12.04</h3>


<h3>For Ubuntu 12.10:</h3>

<code>nano /etc/apache2/mods-available/suphp.conf</code>

comment out the <FilesMatch "\.ph(p3?|tml)$"> section and add the line AddType application/x-httpd-suphp .php .php3 .php4 .php5 .phtml

<pre>
<code>	<IfModule mod_suphp.c>
	    #<FilesMatch "\.ph(p3?|tml)$">
	    #    SetHandler application/x-httpd-suphp
	    #</FilesMatch>
	        AddType application/x-httpd-suphp .php .php3 .php4 .php5 .phtml
	        suPHP_AddHandler application/x-httpd-suphp

	    <Directory />
	        suPHP_Engine on
	    </Directory>

	    # By default, disable suPHP for debian packaged web applications as files
	    # are owned by root and cannot be executed by suPHP because of min_uid.
	    <Directory /usr/share>
	        suPHP_Engine off
	    </Directory>

	# # Use a specific php config file (a dir which contains a php.ini file)
	#       suPHP_ConfigPath /etc/php5/cgi/suphp/
	# # Tells mod_suphp NOT to handle requests with the type <mime-type>.
	#       suPHP_RemoveHandler <mime-type>
	</IfModule>
</code>
</pre>

Restart Apache

<code>/etc/init.d/apache2 restart</code>


<h2>Enjoy!</h2>
