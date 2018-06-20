# Overview

This super-simple task connects to a target Unix or Windows node and invokes the curl- or powershell-based Puppet Enterprise installer for you.  It uses the "multiple implementations" feature, added in Bolt 0.20, so you'll need to be on at least that version.


# Usage

This task takes a single argument, "server" which is the hostname from which to retrieve the curl- or powershell-based installer.  Unless you've done something sneaky, this is just the name of your master.  (It could be a load balancer.)

To use this task, you'll need it available on the system that you're running Bolt from.  You may find it most convenient to add it to your Puppetfile, and run Bolt from your master.  Or you may prefer to simply clone the source repository to your local system, and run Bolt from there.  If you clone the respository, the directory will need to be named simply pe_agent_install, in order for Bolt to find the task.  For instance:

```shell
git clone https://github.com/gabe-sky/puppet-pe_agent_install pe_agent_install
```

Here's an example of using it, supposing
* you've cloned the repository to a local directory,
* have a Puppet master called "kermit,"
* want to be prompted for root's password, and
* would like to run the Puppet Enterprise installer on a Unix node called "animal":

```shell
bolt task run \
pe_agent_install server=kermit \
--modulepath . \
--user root --password \
--nodes ssh://animal
```

Or supposing
* you've added the module to your Puppetfile,
* are running from your master "kermit,"
* want to be prompted for Administrator's password, and
* would like to install Puppet Enterprise on Windows nodes called "janice" and "zoot":

```shell
bolt task run \
pe_agent_install server=kermit \
--user Administrator --password \
--nodes winrm://janice,winrm://zoot
```


# Limitations

This task only works with the Puppet Enterprise "frictionless" curl- and powershell-based installers that are automatically included on a Puppet Enterprise master.
