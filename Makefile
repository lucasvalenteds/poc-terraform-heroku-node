HEROKU_EMAIL = ""
HEROKU_API_KEY = ""
HEROKU_APP_NAME = ""
HEROKU_REGION = ""

init:
	@terraform init

provision: init
	@terraform apply \
			-auto-approve \
			-var heroku_region="$(HEROKU_REGION)" \
			-var heroku_email="$(HEROKU_EMAIL)" \
			-var heroku_api_key="$(HEROKU_API_KEY)" \
			-var heroku_app_name="$(HEROKU_APP_NAME)"

destroy:
	@terraform destroy \
			-auto-approve \
			-var heroku_region="$(HEROKU_REGION)" \
			-var heroku_email="$(HEROKU_EMAIL)" \
			-var heroku_api_key="$(HEROKU_API_KEY)" \
			-var heroku_app_name="$(HEROKU_APP_NAME)"
