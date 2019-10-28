{application,mmorpg,
             [{applications,[kernel,stdlib,elixir,logger,postgrex,ecto_sql]},
              {description,"mmorpg"},
              {modules,['Elixir.Mmorpg.Application',
                        'Elixir.Mmorpg.Controller',
                        'Elixir.Mmorpg.Front.LoginScreen',
                        'Elixir.Mmorpg.Repo','Elixir.Mmorpg.Schema.Character',
                        'Elixir.Mmorpg.Schema.Player']},
              {registered,[]},
              {vsn,"0.1.0"},
              {mod,{'Elixir.Mmorpg.Application',[]}}]}.