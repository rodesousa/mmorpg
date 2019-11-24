postgres: rm
	@docker run -itd --name tactical -p 5432:5432 postgres:latest

rm:
	@docker rm -f tactical 

ecto:
	@mix ecto.create
	@mix ecto.migrate

init:
	@mix test --only init
