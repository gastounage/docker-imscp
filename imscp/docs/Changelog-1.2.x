i-MSCP ChangeLog

------------------------------------------------------------------------------------------------------------------------
1.2.17
------------------------------------------------------------------------------------------------------------------------

2016-03-12: Laurent Declercq
    RELEASE i-MSCP 1.2.17

BACKEND
    Fixed: Can't locate Data/Validate/IP.pm (now lazy-loaded to prevent failure on update) (iMSCP::Net)
    Fixed: peer address not recognized in the case of a pointopoint interface (regression fix)

CONTRIB
    Fixed: Create the provisioning script even with the imscp-setup script (10_named_slave_provisioning.pl)

INSTALLER
    Fixed: Argument "" isn't numeric in numeric eq (==) at engine/PerlLib/Package/FrontEnd/Installer.pm line 270
    Fixed: Could not add intermediate SSL certificates; dialog is always skipped (regression fix)
    Fixed: Could not enable service when unit file is a symlink due to 'No such file or directory' error (systemd)
    Fixed: MariaDB SQL server not selectable on fresh install (regression fix)
    Fixed: Missing mysql-common package in MariaDB package sections (Debian Jessie)
    Fixed: Panel SSL certificate chain not removed when disabling SSL or changing hostname
    Fixed: When changing panel hostname, DNS zone file is not removed

SERVERS
    Fixed: Cannot connect to VsFTPD when behind NAT (WAN <-> LAN)

TOOLS
    Fixed: imscp-net-traffic-logger must not fail if part of rules were already removed

VENDOR
    Added: Class::Autouse Perl module version 2.01 from CPAN

------------------------------------------------------------------------------------------------------------------------
1.2.16
------------------------------------------------------------------------------------------------------------------------

2016-03-10: Laurent Declercq
    RELEASE i-MSCP 1.2.16

CONFIG
    Added: /dev/random and /dev/urandom to open_basedir (PHP)

BACKEND
    Added: iMSCP::Service::hasService() method
    Backported: iMSCP::Provider::NetworkInterface from 1.3.x branch - Provider for adding/removing IP addresses
    Backported: iMSCP::Net changes from 1.3.x branch
    Changed: IP addresses are now persistent (they are added into /etc/network/interfaces file)
    Fixed: Could not create SQL user when using MariaDB SQL remote server
    Fixed: Ip addresses are not validated correctly in iMSCP::Net
    Fixed: macvlan interfaces not properly mapped in iMSCP::Net
    Fixed: Shell arguments must be escaped in imscp-pkt-mngr and imscp-sw-mngr

FRONTEND
    Added: SSL status field on domain management page (Client interface)
    Fixed: Could not add/edit SQL user when using MariaDB server - wrong syntax 'PASSWORD EXPIRE NEVER' ...
    Fixed: Exception raised due to missing `ZIP` configuration variable
    Fixed: Wrong error handling in cert_view.php (openssl_x509_checkpurpose function also returns -1 which is not FALSE)

INSTALLER
    Added: 'panel' reconfiguration item
    Fixed: Could not unset 'hold' state on packages in some contexts
    Fixed: Dialog backup (back up) feature is broken
    Fixed: dpkg: warning: --compare-versions used with obsolete relation operator '<'
    Fixed: Ensure that sysvinit scripts are disabled when upstart job are provided and when init is Upstart
    Fixed: init_is_upstart() function not available in lsb-base < 4.1+Debian3 (sysvinit scripts)
    Fixed: Mitigate possible PHP timezone warning with CLI SAPI
    Fixed: Update notices are not sorted correctly
    Fixed: Use MySQL 5.6 from official Trusty repository in place of MySQL Team repository
    Fixed: Wrong package name (mysql-client-5.5 instead of mysql-client-5.6) in Debian Stretch (testing) packages file
    Pending: Courier support for Debian Stretch (testing) - packages not available at this moment
    Pending: VsFTPd support for Debian Stretch (testing) - libpam-mysql package not available at this moment
    Removed: ispCP migration script (Migration from ispCP is no longer supported)

PACKAGES
    Fixed: Global symbol "$rs" requires explicit package name at Package/Webstats/Awstats/Uninstaller.pm line 103

PLUGINS
    Updated: API version to 1.0.3

SERVERS
    Added: createUser() and dropUSer() methods (SQL server impl.)
    Fixed: MySQL server socket is missing after reboot (only with Upstart init)
    Fixed: Proftpd not running after reload (quick fix - not i-MSCP related)

SERVICES
    Added: imscp_traffic service (imscp traffic logger - iptables rules)
    Fixed: Possible 'socket is already in use' error on imscp_panel service restart, leading to 502 Bad Gateway error
    Removed: imscp_network service - IP addresses are now added into network interface file

SETUP
    Fixed: Could not reconfigure due to 'Could not find sysvinit script...' error

TOOLS
    Fixed: imscp-net-traffic-logger must not depend on the SQL service
    Removed: imscp-net-interface-mngr script (no longer needed because IP addresses are now persistent)

VENDOR
    Added: Net::IP Perl module version 1.26 from CPAN (libnet-ip-perl package under wheezy/precise is too old)
    Updated: Capture::Tiny Perl module to version 0.36
    Updated: Net::Domain::TLD Perl module to version 1.74

YOUTRACK
    IP-1394 httpd-logs-mngr starts before mysql server on reboot
    IP-1428 i-MSCP services such as imscp_network should not depend on the mysql service
    IP-1488 Show SSL-status on domain page
    IP-1499 Reseller can't create hosting plans if mail accounts are disabled
    IP-1500 Update fails when a customer's SSL certificate is invalid or expired
    IP-1501 i18n - "Ftp directories" string is not translatable
    IP-1503 vsftpd - 500 OOPS: prctl PR_SET_SECCOMP failed
    IP-1505 Installer - cannot go back from the panel http port screen

------------------------------------------------------------------------------------------------------------------------
1.2.15
------------------------------------------------------------------------------------------------------------------------

2016-03-02: Laurent Declercq
    RELEASE i-MSCP 1.2.15

BACKEND
    Changed: Usage of custom OpenSSL configuration file for self-signed SSL certificates (iMSCP::OpenSSL)
    Fixed: ALLOW_URL_FOPEN placeholder not replaced in pool configuration files when using per_domain INI level (PHP-FPM)
    Fixed: Exit code not returned to caller on segfault (signal 11)
    Fixed: Missing fallback value for allow_url_fopen in Modules::SubAlias
    Fixed: Obsolete SSL connection encryption method (nginx)

CONFIG
    Added: imscp_panel.service systemd unit file
    Added: OpenSSL configuration template file for self-signed SSL certificates
    Changed: SPF record entries from softfail to hardfail

DAEMON
    Fixed: Missing chdir() and umask() calls
    Fixed: STDIN, STDOUT and STDERR must be redirected to /dev/null
    Updated: Version to 1.2.5

DATABASE
    Added: Default value for the domain.external_mail_dns_ids field
    Added: Default value for the domain_aliasses.external_mail_dns_ids field
    Added: 'status' field to the ftp_users table

FRONTEND
    Fixed: Bad request error when editing PHP settings with per_user INI level (PHP Editor)
    Fixed: Could not add SSL certificate due to 'At least one intermediate certificate is invalid or missing' error
    Fixed: Exception raised due to missing default value for domain.external_mail_dns_ids
    Fixed: When customer account is being disabled, FTP users must be also disabled
    Removed: OpenSSL configuration template file (replaced by /etc/imscp/openssl/openssl.cnf.tpl)

INSTALLER
    Fixed: Can't locate object method "setVersion" via package Servers::sqld::remote_server
    Fixed: Connection timeout with pgp.mit.edu PGP key server (replaced by keyserver.ubuntu.com)
    Fixed: Ensure that mysql service is enabled
    Fixed: Installer must die when server hostname is missconfigured
    Fixed: Missing 'use iMSCP::Crypt qw/decryptBlowfishCBC/' statement in Servers::sqld::remote_server
    Fixed: Missing 'use iMSCP::Execute qw/escapeShell/' statement in Servers::sqld::remote_server
    Fixed: Missing 'use iMSCP::TemplateParser' statement in Servers::sqld::remote_server
    Fixed: Overwrite any existing conflicting symlinks when enabling service (systemd)
    Fixed: Possible use of uninitialized value $sqlServer in autoinstaller/Adapter/DebianAdapter.pm
    Fixed: sysvinit scripts are not enabled when using systemd (regression fix)
    Fixed: Missing APT source repositories for i-MSCP required sections
    Updated: PhpMyAdmin addon installer to support PhpMyAdmin 4.5.x serie (require MySQL >= 5.5 and PHP >= 5.5)

SERVERS
    Added: SQLNegativeCache directive to cache negative responses from SQL lookups (ProFTPD)
    Added: SQLUserWhereClause directive to disallow FTP connection when FTP user status is not 'ok' (ProFTPD)
    Backported: VsFTPd server implementation from 1.3.x branch

YOUTRACK
    IP-1367 Support for the VsFTPd server
    IP-1444 Ubuntu - Vsftpd package broken - libgcc_s.so.1 must be installed for pthread_cancel to work
    IP-1495 Domain alias with shared moint point fails

------------------------------------------------------------------------------------------------------------------------
1.2.14
------------------------------------------------------------------------------------------------------------------------

2016-02-25: Laurent Declercq
    RELEASE i-MSCP 1.2.14

FRONTEND
    Fixed: Could not edit reseller PHP permissions (PHP Editor)
    Fixed: Unchecking all disabled functions has no effect (PHP Editor)

INSTALLER
    Fixed: Password must not be escaped (MySQL installer)

------------------------------------------------------------------------------------------------------------------------
1.2.13
------------------------------------------------------------------------------------------------------------------------

2016-02-24: Laurent Declercq
    RELEASE i-MSCP 1.2.13

CONFIG
    Fixed: Missing /php-fpm/php-fpm.pool.default declaration in configs/ubuntu/php-fpm/install.xml
    Updated: Licence header in skeletons

CONTRIB
    Fixed: "my" variable $cfgTpl masks earlier declaration in same scope (20_dovecot_connections.pl)
    Fixed: "my" variable $cfgTpl masks earlier declaration in same scope (40_dovecot_pfs.pl)

INSTALLER
    Fixed: Ensure that authentication plugin is set to 'mysql_native_password' for SQL root user (MySQL >= 5.7)
    Fixed: Perl DBI (mysql) package removed when using MariaDB server, leading to installation/update failure
    Fixed: Switch policy is ignored (SQL servers)
    Fixed: Wrong package names in Debian Strech package file (MySQL 5.6)

FRONTEND
    Fixed: Unable to handle uncaught exception thrown... Data `translator` is not registered
    Fixed: Exception browser writer doesn't display the expected exception in some contexts
    Fixed: Exception mail writer cache do not work
    Fixed: Unable to establish the connection to the database when using MySQL >= 5.7

------------------------------------------------------------------------------------------------------------------------
1.2.12
------------------------------------------------------------------------------------------------------------------------

2016-02-23: Laurent Declercq
    RELEASE i-MSCP 1.2.12

BACKEND
    Added: Support for TCP/IP (PHP-FPM)
    Backported: iMSCP::Crypt library from 1.3.x branch
    Fixed: Could not remove service: Not a CODE reference at PerlLib/iMSCP/Provider/Service/Systemd.pm line 115
    Fixed: Could not remove service: Unit not loaded (systemd provider)
    Fixed: Don't use Cyrus SASL for SMTP authentication when the Dovecot SASL implementation is available
    Fixed: Mail passwords are no longer valid after client account re-activation

CONFIG
    Added: BACKUP_COMPRESS_LEVEL configuration parameter
    Added: Default www.conf pool configuration file (PHP-FPM)
    Added: docs/imscp_net_sysctl.conf configuration file example
    Added: DOVECOT_SASL_AUTH_SOCKET_PATH parameter in dovecot/dovecot.data file
    Added: event_scheduler parameter in mysql/imscp.cnf file to disable event scheduler (see errata file)
    Added: performance_schema parameter in mysql/imscp.cnf file to disable performance schema (see errata file)
    Added: PHP-FPM parameters (global and per pool configuration parameters) in php-fpm/phpfpm.data file
    Added: SQLD_SOCK_DIR, SQLD_USER and SQLD_GROUP parameters in mysql/mysql.data configuration file
    Added: sql_mode parameter in mysql/imscp.cnf template file to reset server SQL modes (backward compatibility issue)
    Fixed: Missing http authorization headers (PHP-FPM with apache2 mod_proxy_fcgi)
    Fixed: Possible segfault with OPcache when fast shutdown feature is enabled
    Renamed: ZIP configration parameter to BACKUP_COMPRESS_ALGORITHM
    Removed: Dovecot 1.x configuration files
    Removed: procmail mailbox command in Postfix main.cf file
    Updated: Matching rule for PHP files (.php .php3 .php4 .php5 .php7 .pht .phtml)

CONTRIB
    Added: 40_apache2_tools_proxy.pl listener file (redirect/proxy the i-MSCP tools in customers vhost files)
    Added: 10_dovecot_compress.pl listener file (activate Dovecot compress plugin)
    Added: 20_dovecot_connections.pl listener file (allow to increase the mail_max_userip_connections)
    Added: 30_dovecot_namespace.pl listener file (creates the INBOX. as a compatibility name)
    Added: 40_dovecot_pfs.pl listener file (activate the Perfect Forward Secrecy logging)
    Added: 50_dovecot_plaintext.pl listener file (disable plaintext logins and force TLS)
    Added: 60_dovecot_service_login.pl listener file (Allows to modify default service-login configuration options)
    Added: 10_nginx_hsts.pl listener file (enable HTTP Strict Transport Security (HSTS))
    Added: 10_php_confoptions_overide.pl listener file (Allows to add or override PHP configuration options)
    Added: 60_postfix_pfs.pl listener file (add the self-generated EDH parameter files for Perfect Forward Secrecy (PFS))
    Added: 70_postfix_submission_tls.pl listener file (force TLS connection on postfix submission)
    Added: 10_proftpd_tuning.pl listener file (removes the ServerIdent information, and forces TLS)
    Rewritten: 10_named_zonetransfer.pl listener file (now named 10_named_slave_provisioning.pl)
    Updated: 10_postfix_smarthost listener file (We need Cyrus SASL; Dovecot SASL impl. not supported by Postfix for smtp)

DAEMON
    Added: imscp_daemon.service systemd unit file
    Fixed: imscp-rqst-mngr backend script path must not be hardcoded in daemon
    Fixed: PID file /var/run/imscp_daemon.pid not readable (yet?) after start (systemd)
    Updated: Upstart init script according new daemon version - only one fork() call
    Updated: Version to 1.2.4

FRONTEND
    Changed: error_reporting configuration parameter no longer editable when using Apache2 ITK httpd server impl.
    Fixed: admin/settings.php menu state is not saved
    Fixed: Customer's PHP settings must be synchronized when updating PHP permissions of their resellers
    Fixed: Don't thrown an exception on parse_url error, send a 404 response instead (plugins.php)
    Fixed: Slow DOM content loading due to some built-in functions override (imscp.js)
    Fixed: Missing or bad IP check when adding or editing client account (reseller)
    Fixed: Wrong alternative names in self-signed SSL certificates
    Fixed: Wrong edit link for domain alias DNS record (external mail DNS record)
    Removed: Default PHP configuration options - admin level (see errata file)
    Removed: Hosting plan feature - admin level (see errata file)

INSTALLER
    Added: Allow to specify package version to install in distribution package files
    Added: Conflict for procmail package to force its removal when running i-MSCP installer
    Added: Conflict for sasl2-bin package to force its removal when running i-MSCP installer (we don't need saslauthd)
    Added: Default administrator email in aliases(5) table for local root user (e.g. root: <default_admin_email>)
    Added: Routine for upgrading SQL server system tables when necessary (e.g. MySQL Community Server)
    Added: Support for MySQL 5.6.x/5.7.x, Percona 5.7 and MariaDB 10.1 when available (see errata file)
    Added: Support for Ubuntu 16.04 (Xenial Xerus)
    Added: verbose command line option
    Fixed: Could not type new password when reconfiguring service SQL users due to non-printable characters
    Fixed: Dependencies problems when switching to another SQL server vendor
    Fixed: Don't ask admin for SQL root password when not needed (package maintainer script)
    Fixed: Don't ask admin for data directory (/var/lib/mysql) removal (package maintainer script)
    Fixed: Do not try to receive/download repository gpg key if already present
    Fixed: Missing source repositories in APT sources.list
    Fixed: Output from imscp-rqst-mngr must be shown on stdout when verbose mode is enabled (only with noprompt)
    Removed: Support for Ubuntu 15.04 (Vivid Vervet) - Not an LTS version

PLUGINS
    Added: registerSetupListeners() function call to allow the plugins to listen on servers/packages installation events
    Updated: API version to 1.0.2

YOUTRACK
    #IP-0582 PHP editor - PHP configuration levels (per_user, per_domain and per_site) are ignored
    #IP-1289 ProFTPD with TLS behind NAT - Local IP masquerading and passive port range
    #IP-1397 MySQL "SET PASSWORD" deprecated in version 5.7.6
    #IP-1453 The before/after HttpdAddIps events are not always triggered
    #IP-1466 IP change causes SSL error
    #IP-1482 Add support for MySQL 5.6.x/5.7.x using MySQL Team repositories
    #IP-1483 Perl 5.22 - Unescaped left brace in regex is deprecated
    #IP-1486 Do not place order when a domain alias is created by a mutated user
    #IP-1487 A parent domain owner must not be able to create a subdomain if already used as main domain or domain alias

------------------------------------------------------------------------------------------------------------------------
1.2.11
------------------------------------------------------------------------------------------------------------------------

2016-01-06: Laurent Declercq
    RELEASE i-MSCP 1.2.11

BACKEND
    Fixed: Could not remove service (wrong return value)
    Fixed: iMSCP::Rights::_set: cmod: cannot access '/etc/courier/dhparams.pem' : No such file or directory
    Fixed: Missing variable in sprintf statement (iMSCP::Dir)
    Fixed: Optionnal options must be passed-in to onLoadTemplate listeners (httpd server impls.)

CONFIG
    Removed: ProxyErrorOverride parameter which was introduced in version 1.2.10 (Unexpected 503 errors +++)

PLUGINS
    Updated: API version to 1.0.1

------------------------------------------------------------------------------------------------------------------------
1.2.10
------------------------------------------------------------------------------------------------------------------------

2015-12-27: Laurent Declercq
    RELEASE i-MSCP 1.2.10

FRONTEND
    Fixed: 404 error on user statistics page (reseller level)
    Fixed: Wrong issue tracker links in admin/database_update.php

BACKEND
    Fixed: Could not restore domain (undefined variable)
    Fixed: Missing parameter for onLoadTemplate event (imscp.cnf)

YOUTRACK
    #IP-1386 Length of password generator is hardcoded
    #IP-1388 phptmp removed on client update
    #IP-1391 imscp_panel service can fail to start/restart when the APCU PHP extension is installed
    #IP-1393 Unable to disable backup feature for existing domains
    #IP-1394 httpd-logs-mngr starts before mysql.server started
    #IP-1396 Deletion of a subdomain which has '/' as mount point deletes all web folders
    #IP-1401 Courier pop3-ssl and imap-ssl don't work with Windows 10
    #IP-1406 File not found - false error template
    #IP-1417 When changing hostname using the panel_hostname reconfiguration option, The SSL dialog should be triggered
    #IP-1452 pTemplate - reset static variable $_root_dir in /client/cert_view.php

------------------------------------------------------------------------------------------------------------------------
1.2.9
------------------------------------------------------------------------------------------------------------------------

2015-07-03: Laurent Declercq
    RELEASE i-MSCP 1.2.9

BACKEND
    Added: Dedicated server implementation for remote SQL server
    Added: NAMED_BNAME (named binary name) configuration parameter - Named (Bind9) server impl.
    Changed: Customers have now a full read access to their http logs, including those which were rotated
    Changed: Domain's logs are now mounted in customer's logs folder using bind mount instead of being copied
    Fixed: closedir() attempted on invalid dirhandle DIRH at line 312 (iMSCP::Dir)
    Fixed: Due to logs rotation, some httpd logs are never copied into customer's log folders
    Fixed: File /etc/mysql/conf.d/imscp.cnf not loaded when using Percona DB server due to missing /etc/mysql/my.cnf file
    Fixed: POP3 SSL and IMAP SSL services must be disabled when SSL is disabled for the services - Courier server impl.
    Fixed: The .my.cnf file is no longer used and thus, must be removed
    Fixed: Set timezone according TIMEZONE configuration parameter (iMSCP::Bootstrapper::boot())
    Rewritten: iMSCP::Dir library

CONFIG
    Added: ADM_GROUP configuration parameter
    Added: courier-authdaemon init script - Status command from init script provided by Debian/Ubuntu do not work
    Added: mysql.data configuration file
    Added: percona 5.5/5.6 in Debian Jessie package file
    Added: percona 5.5/5.6 in Ubuntu Vivid Vervet package file
    Added: Respawn limit for imscp_daemon and imscp_panel upstart jobs
    Added: TIMEZONE configuration parameter
    Removed: TLS cipher suite - Setting TLSProtocol TLSv1 is sufficient to protect against poodle attack (ProFTPD)
    Removed: PHP_TIMEZONE parameter (replaced by global TIMEZONE parameter)

CONTRIB
    Added: Script which allow to test services for poodle vulnerability (poodle.sh)

FRONTEND
    Fixed: Domain limit is not updated when a domain is being deleted (reseller level)
    Fixed: Opcode cache must be cleared when the languages index is rebuilt

INSTALLER
    Added: Progress info for i-MSCP composer packages (dialog)
    Added: timezone item for the reconfigure command line option (Allow to setup global timezone)
    Fixed: Invalid version format (non-numeric data) when updating from an RC release

YOUTRACK
    #IP-0792 Allow customers to see real-time http access and error logs
    #IP-1362 Incorrect PHP temporary directory path in subdomain's vhost files - Apache2 ITK server impl.
    #IP-1363 Unable to suspend customer account
    #IP-1364 Custom DNS records are lost when editing domain properties
    #IP-1371 Bug - When removing domain alias, the vhost link in /etc/apache2/sites-enabled is not removed
    #IP-1373 Compliance with RFC 2142 - Add a hostmaster address by default
    #IP-1374 Allows reuse of same SQL username for i-MSCP managed services such as phpmyadmin, proftpd...

------------------------------------------------------------------------------------------------------------------------
1.2.8
------------------------------------------------------------------------------------------------------------------------

2015-06-20: Laurent Declercq
    RELEASE i-MSCP 1.2.8

BACKEND
    Fixed: Unable to disable domain name (Apache2 FCGID server implementation)

------------------------------------------------------------------------------------------------------------------------
1.2.7
------------------------------------------------------------------------------------------------------------------------

2015-06-19: Laurent Declercq
    RELEASE i-MSCP 1.2.7

BACKEND
    Fixed: BASE_SERVER_VHOST placeholder is not replaced in vhost files (httpd server implementations)
    Fixed: Unable to delete domain alias - Can't locate object method _getSharedMountPoints via package Modules::Alias
    Fixed: Unable to delete subdomain - Can't locate object method _getSharedMountPoints via package Modules::Subdomain

------------------------------------------------------------------------------------------------------------------------
1.2.6
------------------------------------------------------------------------------------------------------------------------

2015-06-18: Laurent Declercq
    RELEASE i-MSCP 1.2.6

BACKEND
    Changed: Primary phptmp directory is now used by all PHP sites
    Fixed: Wrong TMPDIR set in fcgi starter script for domains which use mount point of another domain
    Fixed: Wrong TMPDIR set in pool configuration files for domains which use mount point of another domain
    Fixed: Wrong TMPDIR set in php.ini configuration files for domains which use mount point of another domain
    Removed: BASE_SERVER_VHOST BASE_SERVER_VHOST_PREFIX and WWW_DIR data - Modules::Alias::_getHttpdData()
    Removed: BASE_SERVER_VHOST BASE_SERVER_VHOST_PREFIX and WWW_DIR data - Modules::Domain::_getHttpdData()
    Removed: BASE_SERVER_VHOST BASE_SERVER_VHOST_PREFIX and WWW_DIR data - Modules::SubAlias::_getHttpdData()
    Removed: BASE_SERVER_VHOST BASE_SERVER_VHOST_PREFIX and WWW_DIR data - Modules::Subdomain::_getHttpdData()
    Removed: Useless deletion of the vlogger entries by the HTTPD server impl. when a domain is deleted - Those entries
        are automatically deleted by the imscp-vrl-traff script

DATABASE
    Fixed: Mysql IGNORE extension doesn't work with Fast Index Creation (MySQL Bug #40344)
    Fixed: MySQL IGNORE extension is deprecated as of MySQL 5.6.17
    Fixed: Possible duplicate entries when adding UNIQUE constraints

FRONTEND
    Changed: Increased number of items to display by default in data tables (previous value was 5, it is now 10)

YOUTRACK
    #IP-1358 Admin's tickets can't be deleted due to an additional quotation-mark in the template

------------------------------------------------------------------------------------------------------------------------
1.2.5
------------------------------------------------------------------------------------------------------------------------

2015-06-14: Laurent Declercq
    RELEASE i-MSCP 1.2.5

BACKEND
    Fixed: Bad SQL query which leads to orphaned entries in the admin table, and which is the cause of several side
        effects such as many bad request errors (e.g: when editing a reseller, or when accessing its statistics...)
    Fixed: Usage of portable syntax over Bash 4 syntax (I/O Redirection)
    Fixed: Wrong syntax for the nice command (at several places)

CONFIG
    Fixed: Missing paths in PATH environment variable for cron tasks

DATABASE
    Fixed: Do not try to remove inexistent indexes +++

FRONTEND
    Fixed: Don't add the default ports (80/443) in notifications when not needed (e.g: when using PanelRedirect plugin)
    Fixed: ID mismatch when the created_by field of a reseller is unknown (edit and delete links)

i18N
    Removed: Untranslated languages - Breton (br), Czech (cz), Galician (gl), Georgian (ka), Hebrew (he_IL),
        Icelandic (is_IS), Spanish (es), and Serbian (sr)

YOUTRACK
    #IP-1357 Built in Support Ticket shows wrong URL (missing Control Panel Port)

------------------------------------------------------------------------------------------------------------------------
1.2.4
------------------------------------------------------------------------------------------------------------------------

2015-06-12: Laurent Declercq
    RELEASE i-MSCP 1.2.4

BACKEND
    Fixed: Both CPU and I/O priorities must be reduced to mitigate high load and latencys (backup scripts)
    Fixed: Depending on the context, some service providers are not initialized
    Fixed: Removed warning for inexistent mail directories (backup script)
    Fixed: Services are started instead of being reloaded when already running (iMSCP::Provider::Service::Upstart)
    Fixed: Undefined domain_status field (Modules::Domain)
    Fixed: Warnings must not be turned into errors (backup script)
    Fixed: Wrong return value on failure (request manager)

CONFIG
    Added: courier-authdaemon init script - Init script provided by Ubuntu do not work (Ubuntu only)
    Added: ProxyTimeout setting into 00_nameserver.conf Apache2 configuration file
    Added: types_hash_max_size setting in nginx.conf configuration file

FRONTEND
    Added: Cache support for navigation translation files
    Fixed: Unable to set language

PACKAGES
    Fixed: users.mail_host field must be set to 'localhost' (Package::Webmail::Roundcube::Installer)

YOUTRACK
    #IP-1353 i18n issue - Admin / System information not translatable

------------------------------------------------------------------------------------------------------------------------
1.2.3
------------------------------------------------------------------------------------------------------------------------

2015-06-07: Laurent Declercq
    RELEASE i-MSCP 1.2.3

BACKEND
    Added: Custom DNS module (Modules::CustomDNS)
    Added: Mail support in backup feature
    Added: New 'temporary' attribute which allow to override configuration values temporarily (iMSCP::Config)
    Added: onBeforeSetPluginStatus event (Modules::Plugin)
    Added: PHP_FCGI_CHILDREN, PHP_FCGI_MAX_REQUESTS and PHP_VERSION configuration parameters (apache_fcgid)
    Added: Service providers (Sysvinit, Upstart and Systemd)
    Changed: Perl version >= 5.14.2 is now required
    Changed: Service configuration files are now lazy-loaded
    Fixed: Any task which belongs to the custom DNS records layer must not involve HTTPD configuration change
    Fixed: Bind9 must not be restarted each time a DNS zone is updated. A simple reload is sufficient
    Fixed: Force usage of search path when executing external commands
    Fixed: Frontend http port must be added in server traffic accounting
    Fixed: In some contexts, configuration files which belongs to subdomains are not regenerated
    Fixed: Last rotated log file must be processed when log rotation is detected (Servers::mta::postfix::getTraffic())
    Fixed: Last rotated log file must be processed when log rotation is detected (Servers::po::courier::getTraffic())
    Fixed: Last rotated log file must be processed when log rotation is detected (Servers::po::dovecot::getTraffic())
    Fixed: Some errors are not trapped
    Fixed: When the backend is invoked by the i-MSCP daemon, some paths are missing (iMSCP::ProgramFinder)

CONFIG
    Added: bind9.service and bind9-resolve.service systemd unit files (Allows to fix #IP-1333 and #IP-1334)
    Added: imscp_daemon, imscp_network and imscp_panel upstart jobs
    Added: libbit-vector-perl package in list of pre-required packages (Debian / Ubuntu)
    Added: libclass-insideout-perl and libscalar-defer-perl in list of pre-required packages (Debian / Ubuntu)
    Added: php-apc package (Debian < Jessie / Ubuntu < Trusty Thar)
    Added: Support for Debian Strech (testing)
    Changed: Install nginx-light package instead of nginx package
    Fixed: Merged apache2 logrotate definitions to mitigate segfault on reload
    Fixed: Wrong TMPDIR path (php5-fpm)
    Removed: INIT_SCRIPTS_DIR, SERVICE_INSTALLER, SERVICE_MNGR, IMSCP_DAEMON_SNAME, IMSCP_NETWORK_SNAME and
        IMSCP_PANEL_SNAME configuration parameters
    Removed: mariadb 5.5 from Debian Jessie package file (replaced by mariadb 10.0)
    Renamed: FCGI starter template to php-fcgi-starter (apache_fcgid server impl.)

DAEMON
    Added: End child syslog message
    Fixed: Avoid useless 'fork' and 'wait' by using execl() instead of system() (lr_syntax.c)
    Fixed: warning: ignoring return value of ‘chdir’... (daemon_init.c)
    Updated: Version to 1.2.3

DATABASE
    Added: domain_dns_status field in domain_dns table (Custom DNS record status field)
    Added: plugin_config_prev field in plugin table (Plugin previous configuration field)
    Added: Unique constraint on server_traffic.traff_time column to avoid duplicate time periods
    Fixed: Missing unique constraint for mail_users entities (added unique constraint on mail_users.mail_addr)

DISTRIBUTIONS
    Added: Support for Ubuntu Vivid Vervet (Not an LTS version but this is the first with full systemd support)
    Removed: Support for Debian Squeeze (6.x) - Do not fit with new i-MSCP requirements (Perl version is too old)
    Removed: Support for Ubuntu Lucid Lynx (10.04 LTS) - EOL as per April 30, 2015 (Server version)

FRONTEND
    Added Custom DNS items in debugger interface (admin level)
    Added: Mail support in backup feature
    Added: Path to openssl.cnf file into php.ini file
    Added: ntr() function for plural support (i18n)
    Changed: Stores the Github payload as json file instead of PHP file (iMSCP_Update_Version::getUpdateInfo())
    Fixed: Client domain management page must not be hidden even if customer cannot add domain aliases and subdomains
    Fixed: Do not fetch more data than needed from GitHub (iMSCP_Update_Version::getUpdateInfo())
    Fixed: Force reload of newest mail body footprint file (iMSCP_Exception_Writer_Mail::onUncaughtException())
    Fixed: Html in title attribute must not be auto-escaped by jQueryUI tooltip
    Fixed: Translate the INADDR_ANY (0.0.0.0) IP address to 'Any' (Services status)
    Fixed: Self-signed SSL certificates - serial numbers must be unique
    Improved: Translations strings entries can now be accessed as object properties (i18n_getJsTranslations())
    Removed: imscp_delete_opcode_file() and imscp_clear_opcode_cache() functions

INSTALLER
    Added: Debug output when installer is run with --noprompt and --debug options
    Added: package_conflict field which allows to declare conflicting package that must be pre-removed
    Added: repository_conflict attribute which allows to declare a conflicting repository that must be removed
    Added: Update notices
    Fixed: Ensure that all required services are enabled
    Fixed: Missing Email::Simple Perl module (no longer required)
    Fixed: Use of uninitialized value $dbPass in string (imscp/engine/setup/imscp-setup-methods.pl line 482)
    Fixed: Wrong package name in preseed file (RainLoop)

PACKAGES
    Fixed: Missing return statement on database update error (Package::Webmail::Roundcube::Installer)
    Renamed: Fcgid starter template to php-fcgi-starter (FrontEnd)

PLUGINS
    Added: iMSCP_Plugin::getConfigPrev() and iMSCP_Plugin::getConfigPrevParam() methods
    Added: require_api info field (field which allows the plugins to define the required i-MSCP plugin API version)
    Changed: info, config and config_prev fields are now automatically decoded and set as plugin properties (backend)
    Fixed: Force reload of newest plugin info file (iMSCP_Plugin::getInfo())
    Fixed: Force reload of newest plugin configuration file (iMSCP_Plugin::getConfigFromFile())
    Fixed: Opcode cache is not correctly resetted on plugin list update
    Updated: API to version 1.0.0

SKELETON
    Removed: Link to the panel in default index.html files (panel must not be publicly exposed)
    Fixed: Wrong link for favicon in error pages

SERVICES
    Added: Log summary message on TLS handshake completion (Postfix)
    Fixed: Apache access.log files are put in wrong directory (vlogger)
    Fixed: Disable warnings about missing SPF DNS record (As per RFC 7208, SPF DNS record is deprecated - Bind9)

YOUTRACK
    #IP-0321 When a customer deletes a domain alias, all related entities must be automatically deleted
    #IP-1082 net2ftp SSL Bug - http scheme badly detected - Missing HTTPS server variable
    #IP-1257 Self-signed SSL certificate - SHA256 should be used in place of SHA1
    #IP-1275 Apache access logs are created in /<domain.tld>
    #IP-1279 Autoresponder - Unable to get message body
    #IP-1286 IP attachment fails on reboot (Ubuntu)
    #IP-1292 Files from a previous plugin version must be kept if the new plugin version is not compatible
    #IP-1314 Custom DNS SRV record - Missing TLS protocol
    #IP-1315 Defect - Statistics overview with special characters breaks view
    #IP-1323 Invalid query result column used in change_domain_status() function
    #IP-1327 Unable to add subdomain (subals) - An error occurred while reading flags on ...
    #IP-1330 Proftpd - Unable to connect to i-MSCP database
    #IP-1332 nginx / nginx-light package configuration fail which result to i-MSCP installation failure
    #IP-1333 Local resolver not added into resolv.conf file
    #IP-1334 Jessie - Bind9 options from /etc/default/bind9 file are ignored
    #IP-1340 The public/tools/filemanager folder is not removed
    #IP-1345 MySQL - Do not touch the local /root/.my.cnf file

------------------------------------------------------------------------------------------------------------------------
1.2.2
------------------------------------------------------------------------------------------------------------------------

2015-02-12: Laurent Declercq
    RELEASE i-MSCP 1.2.2

BACKEND
    Fixed: Invalid argument at /usr/share/perl5/MIME/Entity.pm line 1878 (autoreply script)
    Fixed: Wrong sqld server name
    Fixed: Vlogger - High CPU usage

FRONTEND
    Fixed: Wrong URL in default email templates (Missing port)
    Updated: Logo and CSS

INSTALLER
    Added: panel_ports item for the --reconfigure command line option
    Fixed: Encoding issue when running installer through SSH with PuTTY

PACKAGES
    Added: Ports dialog (FrontEnd package)
    Fixed: Several event listeners are registered too late (regression fix)
    Fixed: Awstats section not added in vhost files

PLUGINS
    Updated: API to version 0.2.17

YOUTRACK
    #IP-1259 Layout - Text goes out of statistic bar
    #IP-1263 Access to statistics (Awstats) is broken - 404 error
    #IP-1267 Double-quotes in the Dovecot SQL user's password must be escaped

------------------------------------------------------------------------------------------------------------------------
1.2.1
------------------------------------------------------------------------------------------------------------------------

2015-02-06: Laurent Declercq
    RELEASE i-MSCP 1.2.1

BACKEND
    Added: Checks for a2enconf/a2disconf command availability
    Added: -h (help) short option (iMSCP::Getopt module)
    Fixed: Composer cache is not cleared correctly
    Fixed: LC_MESSAGES has not expected effect in backend's scripts
    Fixed: Module's actions are called twice
    Fixed: Postfix not restarted in some contexts (Missing iMSCP::Service module)
    Fixed: Useless instantiation of servers
    Fixed: Wrong umask when the imscp-rqst-mngr script is run through the i-MSCP Daemon
    Moved: Local DNS resolver question into bind9 installer
    Removed: Deprecated IMSCP_CLEAR_SCREEN environment variable
    Removed: imscp-local-dns-resolver script (The bind9 initscript invokes resolvconf itself)
    Removed: policyd-weight and postgrey (Postfix SMTP access policy delegation)

CONFIG
    Added php5-json package (Debian Jessie)
    Moved: Local DNS resolver parameters from the imscp.conf file to the bind.data configuration file

DAEMON
    Fixed: Messages must not be hardcoded in functions
    Fixed: Restart of some services fail when the backend (imscp-rqst-mngr) is run through the daemon
    Updated: Version to 1.2.2

DISTRIBUTIONS
    Changed: Dovecot is now installed using packages from backports repository (Squeeze, Wheezy)
    Changed: Postfix is now installed using package from backports repository (Squeeze, Wheezy)

FRONTEND
    Added: Support for eAccelerator, XCache and ZendOptimizerPlus opcode caches
    Fixed: Usage of autoloader instead of require_once
    Fixed: Wrong classname iMSCP_Listener (should be iMSCP_Events_Listener)
    Fixed: Wrong classname iMSCP_Listener_PriorityQueue (should be iMSCP_Events_Listener_PriorityQueue)

INSTALLER
    Fixed: Dovecot packages installation fail when no SSL certificate is generated
    Fixed: Length of SQL's usernames and passwords is not validated (they must be at least 6 characters long)
    Fixed: Migration from Courier to Dovecot is broken (courier-dovecot-migrate.pl is run with a wrong option)
    Fixed: php5enmod command throws an error when a PHP module is missing (PHP5.4)
    Fixed: rsync: failed to set times on "/var/www/virtual": Operation not permitted (1)
    Fixed: Unable to define custom APT repository without key (Debian, Ubuntu)
    Removed: 'resolver' configuration item (local DNS resolver question is now part of 'named' configuration item)
    Renamed: 'webmail' configuration item to 'webmails' (--reconfigure command line option)

PACKAGES
    Added: RainLoop package (alternative webmail)
    Changed: Installation of webmail package is now optional
    Fixed: Length of SQL's usernames and passwords is not validated (they must be at least 6 characters long)
    Fixed: Single quotes in sql usernames must be escaped in configuration files (PhpMyAdmin, Roundcube)
    Fixed: The force-reinstall installer command line option shouldn't be ignored by package installers
    Fixed: The skip-distro-packages installer command line option shouldn't be ignored by package installers
    Updated: logresolvmerge.pl script from Awstats package to version 1.2 (build 20140126)
    Updated: Pydio (formely AjaxPlorer) package installer according new upstream release (6.x)

PLUGINS
    Fixed: Plugins that don't implement an API method which is being executed must not be instantiated
    Fixed: Plugin uninstall() method must stay optional, even if the install() method is implemented
    Updated: API to version 0.2.16

YOUTRACK
    #IP-1205 Good practices - Use "-h" as abbrev for "--help" (instead of "-?")
    #IP-1206 Good practices - Install resolvconf only when bind9 is also installed
    #IP-1207 Defect - DataTable - Sorting not functional for data strings containing numeric values
    #IP-1208 Task - Untranslatable string
    #IP-1209 Cosmetics - Data usage bar glitches on 4k screens
    #IP-1217 Defect - Faulty cron for removing old backend logs
    #IP-1223 Bug - Admin log shows server IP instead of user IP
    #IP-1225 iMSCP::Service - Dovecot take more than 5 seconds to start in some contexts
    #IP-1226 Panel maintenance mode: text message error
    #IP-1227 Page reseller statistics shows the same max/curr traffic/disk for all resellers
    #IP-1228 Adding SSL-certificate causes undefined index warning
    #IP-1229 Courier - CRAM-MD5 authentication not enabled by default
    #IP-1230 RFC 7208 states that DNS SPF shoudln't be used anymore
    #IP-1233 Autoresponder script (imscp-arpl-msgr) cannot write in /var/log/imscp/imscp-arpl-msgr
    #IP-1234 IPv6 addresses causes exception
    #IP-1235 Cosmetics - Reseller overview - Exception in domain status breaks the layout
    #IP-1238 Question mark information box not functioning when switching page
    #IP-1239 SSL Certificate - Usage of CA certificates as provided by OS for validation
    #IP-1240 Statistics wrong (too high) - only admin values
    #IP-1241 Allow customers to generate self-signed SSL certificate for their domains through the frontEnd
    #IP-1246 PHP modules - Priority order - Priority is not honored in some contexts
    #IP-1247 Apache2 - vlogger - failed unexpectedly
    #IP-1251 Bug - per_user/per_domain settings - wrong domains/paths in php.ini
    #IP-1252 Unable to add SSL certificate in some contexts
    #IP-1256 Backup script - The SQL root password is shown in processes table

------------------------------------------------------------------------------------------------------------------------
1.2.0
------------------------------------------------------------------------------------------------------------------------

2014-12-30: Laurent Declercq
    RELEASE i-MSCP 1.2.0

BACKEND
    Added: FETCH_MODE option in iMSCP::Database::mysql
    Added: iMSCP::ProgramFinder module which allow to test whether programs are available on the executable search path
    Added: iMSCP::Service module for service management (start, stop, restart, reload, status)
    Added: Methods which allow to enable/disable apache conffiles from the conf-available directory (Apache 2.4.x)
    Added: pigz (Parallel Implementation of GZip) algorithm for backups compression
    Added: Standard directory which allow to load apache conffiles prior any other vhost file (Apache)
    Added: --verbose command line options for all scripts
    Changed: i-MSCP frontEnd is now run through a dedicated httpd instance by using the nginx Web server
    Changed: Logfiles are now written as soon as possible (allows to mitigate memory consumption)
    Changed: The quota accounting script is now run every 30 minutes
    Fixed: Backend logs which are older than 7 days are never removed

CONFIG
    Fixed: The time at which the backup script must be run is no configurable
    Renamed: /etc/imscp/hooks.d directory to /etc/imscp/listeners.d
    Removed: Roundcube configuration directory (now shipped with the roundcube package)

DAEMON
    Fixed: The server traffic must be collected before any stopping attempt (imscp_network)

DISTRIBUTIONS
    Removed: Support for obsolete Ubuntu versions (Quantal Quetzal, Raring Ringtail, Saucy Salamander)

DOCS
    Updated: INSTALL files

FRONTEND
    Changed: The frontEnd is now reachable through dedicated Web server (Nginx)
    Changed: The frontEnd is now reachable through dedicated http ports (default is 8080 for http and 4443 for https)

INSTALLER
    Added: panel_hostname, system_hostname, panel_ssl and services_ssl reconfiguration items
    Moved: Control panel hostname and SSL dialogs into FrontEnd installer
    Renamed: hostname configuration item to hostnames
    Renamed: Option --hook-file to --listener
    Fixed: Prevent start of apache2 service by package manager using policy layer interface
    Fixed: Unable to handle i-MSCP services (start/restart/stop...) on systems using systemd (e.g Jessie)

PACKAGES
    Updated: Roundcube installer according new roundcube version (1.0.3)

UNINSTALLER
    Added: Backend exec mode (uninstall)

YOUTRACK
    #IP-1123 Review - PHP session handling
    #IP-1122 Defect - Network traffic passing through the loopback interface shouldn't be monitored
    #IP-1146 Bug - Server statistics script is broken

------------------------------------------------------------------------------------------------------------------------
Older release series
------------------------------------------------------------------------------------------------------------------------

See ./docs/Changelog-x.x.x files
