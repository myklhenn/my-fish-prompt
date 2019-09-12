function fish_prompt

	# print username, hostname, working directory
	set -l prevstatus $status
	set -l user (whoami)
	#set -l host (string replace ".local" "" (hostname))
	set -l host (if test (uname) = "Darwin"; scutil --get LocalHostName; else; hostname; end)
	set -l pwdcolor (if test $user = "root"; echo -ns "red"; else; echo -ns "green"; end)
	set -l pwd (prompt_pwd)

	switch $prevstatus
		case 0
			set_color blue; echo -ns $user
			set_color normal; echo -ns "@"
			set_color purple; echo -ns $host
			set_color $pwdcolor; echo -ns " $pwd "
		case '*'
			set_color red
			echo -ns "$user@$host $pwd "
	end

	# check if in a git repository
	if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
		set -l dirty (command git status -s --ignore-submodules=dirty 2> /dev/null)
		set -l ref (command git describe --tags --exact-match ^/dev/null
			or command git symbolic-ref --short HEAD 2> /dev/null
			or command git rev-parse --short HEAD 2> /dev/null)
		# print git branch/ref and status
		if test -n "$dirty"
			set_color red; echo -ns "[*$ref] "
		else
			set_color cyan; echo -ns "[$ref] "
		end
	end
	set_color normal

	# print a dot for each item in the directory stack
	for i in $dirstack
		echo -ns "."
	end

	# print number of running jobs (if any)
	set -l job_count (jobs | wc -l | string trim)
	if test $job_count -gt 0
		echo -ns "($job_count)"
	end

    # print prompt symbol (end of prompt)
    if test $user = "root"
        echo -ns "# "
    else
        echo -ns "\$ "
    end
end

function fish_mode_prompt
	# do nothing if not in vi mode
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        set_color normal; echo -ns '-'
        switch $fish_bind_mode
            case default
                set_color red
                echo 'N'
            case insert
                set_color green
                echo 'I'
            case replace-one
                set_color green
                echo 'R'
            case visual
                set_color magenta
                echo 'V'
        end
        set_color normal; echo -n '- '
    end
end
