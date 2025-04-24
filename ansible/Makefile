.PHONY: prepare-servers

prepare-servers:
	ansible-playbook -i inventory.ini playbook.yml

deploy:
	ansible-playbook -i inventory.ini deploy.yml

check-status:
	ansible webservers -i inventory.ini -a "docker ps -f name=redmine"

check-db:
	ansible webservers -i inventory.ini -m postgresql_query \
	  -a "login_host={{ db_hosts[0] }} \
	      login_user={{ db_user }} \
	      ssl_mode=verify-full \
	      query='SELECT version()'" \
	  --vault-password-file $(VAULT_PASS)

code-setup:
    cd code && \
    ansible-galaxy collection install community.postgresql:3.0.0 && \
    ansible-galaxy collection install community.docker:3.0.2 && \
    ansible-galaxy collection install git+https://github.com/DataDog/ansible-datadog.git,4.12.0 --pre
    ansible-galaxy role install -r requirements.yml