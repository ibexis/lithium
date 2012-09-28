# Lithium

## Controlling sysadmin insanity

Lithium is a system of configurations and a command line tool to 
control cloud based server instances. Currently it supports Linode.

### Install ###
To install prequisites:

    npm -f install

(The '-f' ought not to be required, but is, because of a bug in 
the linode-api package).

### Keeping Current ###

Every now and then you'll need to get fresh copies of the
sources (when they change, for example).  There are lots of
interlinked repositories.  Assuming these have already been set
up in adjacent directories and you are already in the directory
that contains them all, then:

    for a in lithium/ swops/ swops-secret/ cobalt/
    do
        (cd $a;git pull)
    done

### Usage ###

Activate the environment (fiddles with PATH etc):

    . activate

The environment variables LINODE\_API\_KEY and LITHIUM\_CONFIG\_PATH
need to be set, but usually the activate script will set these
as long as it finds the 'swops-secret' repository alongside this
one.

    Usage: li <command> [OPTIONS]
     Commands:
      help                                Show this help
      start <instance>                    Start an instance
      stop <instance>                     Stop an instance
      restart <instance>                  Restart an instance
      create <config>                     Create and deploy an instance by config
      destroy <instance-name> ...         Destroy an instance (or instances)
      rename <name> <new-name>            Rename an instance
      sh <instance> <cmd>                 Execute a command on instance
      ssh [user@]<instance-name>          Log in to instance via ssh
      runhook <instance> <config> [hook]  Run deployment hook(s)
      comment <instance> [<comment>]      Make or display a comment
      list                                List instances
      jobs                                List all Linode jobs

### Tests ###

Note: Make sure LITHIUM\_CONFIG\_PATH and LINODE\_API\_KEY are unset before running the tests.

To run the tests

    LITHIUM_CONFIG_PATH= mocha

Keep the tests running 

    mocha -w


### Using Lithium ###

Using lithium spends money.  Not much.

    li
    li list
    li create boxecutor
    li start boxecutor_1
    li deploy boxecutor_1

### Server States ###

                              .---------stop----------.
                              v                       |
    +-----+            +-------------+           +---------+
    |     | --create-> | not running | --start-> | running |
    +-----+            +-------------+           +---------+
       ^                      |                       |
       `-------------------destroy--------------------'
                            

