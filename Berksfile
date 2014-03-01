site :opscode
group :integration do
  cookbook 'minitest-handler'
end

metadata

cookbook "wordpress", "~> 1.2.0"
# cookbook "wp-cli", git: "git@github.com:BlakeTidwell/cookbook-wp-cli.git"
cookbook "wp-cli", path: "#{ENV['HOME']}/Code/ops_workspace/cookbooks/wp-cli"
cookbook "composer", git: "git@github.com:zircote/chef-composer.git"