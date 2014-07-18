require 'sdoc'

namespace :doc do
  task :app_reaper do
    puts "\e[31mrm -r doc/app\e[0m"
    puts `rm -r doc/app`
    # -o is output folder
    # -N adds line numbers
    # -m specifies "main" (default) page
    # --markup specifies the markup language
    # -H shows the # before linked method names
    # -w sets the tab width's number of characters
    # -t specifies the title for the documentation
    # -i enumerates directories to include
    # -x enumerates directories to exclude
    puts `sdoc -o doc/app -N -m README.md --markup=markdown  -H -w 2 -t 'College-Reaper Rails Application Documentation' -i app -i lib -x bin -x config -x db -x doc -x log -x spec -x vendor`
  end
end