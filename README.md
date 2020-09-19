# POC: Terraform Heroku (Node)

It demonstrates how to provision a NodeJS application and a Postgres database at Heroku using Terraform.

The application should respond HTTP requests with a JSON containing the current timestamp returned from the database.

Both application and database should be deployed without manual actions. The only manual step needed is to put Heroku credentials in `Makefile` variables.

## How to run

| Description | Command |
| :--- | :--- |
| Provision | `make provision` |
| Destroy | `make destroy` |

## Preview

```
$ make provision 

Initializing the backend...

Initializing provider plugins...
- Using previously-installed heroku/heroku v2.6.1

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
heroku_app.application: Creating...
heroku_app.application: Creation complete after 7s [id=poc-terraform-heroku-node]
heroku_addon.database: Creating...
heroku_addon.database: Creation complete after 1s [id=e30ddd8d-54a1-4490-b7ef-cbc4953deca0]
heroku_build.application: Creating...
heroku_build.application: Still creating... [10s elapsed]
heroku_build.application: Still creating... [20s elapsed]
heroku_build.application: Still creating... [30s elapsed]
heroku_build.application: Creation complete after 34s [id=2c434765-3862-479f-a548-e3226e332614]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

Outputs:

application_url = https://poc-terraform-heroku-node.herokuapp.com
```

```
$ make destroy 

heroku_app.application: Refreshing state... [id=poc-terraform-heroku-node]
heroku_addon.database: Refreshing state... [id=e30ddd8d-54a1-4490-b7ef-cbc4953deca0]
heroku_build.application: Refreshing state... [id=2c434765-3862-479f-a548-e3226e332614]
heroku_build.application: Destroying... [id=2c434765-3862-479f-a548-e3226e332614]
heroku_addon.database: Destroying... [id=e30ddd8d-54a1-4490-b7ef-cbc4953deca0]
heroku_build.application: Destruction complete after 0s
heroku_addon.database: Destruction complete after 0s
heroku_app.application: Destroying... [id=poc-terraform-heroku-node]
heroku_app.application: Destruction complete after 1s

Destroy complete! Resources: 3 destroyed.
```
