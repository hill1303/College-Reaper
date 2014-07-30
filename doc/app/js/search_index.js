var search_data = {"index":{"searchIndex":["applicationcontroller","applicationhelper","autocompletehelper","college","completion","completionscontroller","course","coursegroup","flashhelper","genschedulehelper","mockschedule","schedulegenerator","location","rgeo","person","preference","publiccontroller","requirementgroup","schedule","schedulescontroller","section","term","user","about()","assign_class_section!()","autocompleted_course_to_id()","bias_param()","bias_slider()","configure_permitted_parameters()","contact()","convert_and_clean_up_dates()","courses_for_autocomplete()","create()","destroy()","display_flash_messages()","edit()","eql?()","evaluate!()","evaluate_population()","evolve_schedules()","exchange_genes!()","fill_schedule!()","flatten_courses()","flatten_exclusions()","generate_permutations_of_schedules()","generate_schedules()","hash()","home()","index()","index()","is_valid?()","mutate!()","new()","new()","new_generation!()","privacy()","purge_and_replace_invalid_schedules!()","reset!()","run_schedules()","safe_assignment?()","select_mate()","set_class_sections()","sexes()","show()","show()","sort_by_preferences()","suffixes()","terms()","tips()","titles()","unassign_class_section!()","update()","update()","gemfile","gemfile.lock","readme","rakefile","application.coffee","application.scss","autocomplete.scss","foundation_and_overrides.scss","schedule_display.scss","application.css","application.js","index.html","404.html","422.html","500.html","favicon.ico","robots","rich.html","rich.html","rich.html","rich.html","rich.html","rich.html","rich.html","rich.html","rich.html"],"longSearchIndex":["applicationcontroller","applicationhelper","autocompletehelper","college","completion","completionscontroller","course","coursegroup","flashhelper","genschedulehelper","genschedulehelper::mockschedule","genschedulehelper::schedulegenerator","location","location::rgeo","person","preference","publiccontroller","requirementgroup","schedule","schedulescontroller","section","term","user","publiccontroller#about()","genschedulehelper::mockschedule#assign_class_section!()","applicationhelper#autocompleted_course_to_id()","schedulescontroller#bias_param()","applicationhelper#bias_slider()","applicationcontroller#configure_permitted_parameters()","publiccontroller#contact()","schedulescontroller#convert_and_clean_up_dates()","autocompletehelper#courses_for_autocomplete()","completionscontroller#create()","completionscontroller#destroy()","flashhelper#display_flash_messages()","completionscontroller#edit()","genschedulehelper::mockschedule#eql?()","genschedulehelper::mockschedule#evaluate!()","genschedulehelper::schedulegenerator::evaluate_population()","genschedulehelper::schedulegenerator::evolve_schedules()","genschedulehelper::schedulegenerator::exchange_genes!()","genschedulehelper::mockschedule#fill_schedule!()","schedulescontroller#flatten_courses()","schedulescontroller#flatten_exclusions()","genschedulehelper::schedulegenerator::generate_permutations_of_schedules()","genschedulehelper::schedulegenerator::generate_schedules()","genschedulehelper::mockschedule#hash()","publiccontroller#home()","completionscontroller#index()","schedulescontroller#index()","genschedulehelper::mockschedule#is_valid?()","genschedulehelper::schedulegenerator::mutate!()","completionscontroller#new()","genschedulehelper::mockschedule::new()","genschedulehelper::schedulegenerator::new_generation!()","publiccontroller#privacy()","genschedulehelper::schedulegenerator::purge_and_replace_invalid_schedules!()","genschedulehelper::mockschedule#reset!()","schedulescontroller#run_schedules()","genschedulehelper::mockschedule#safe_assignment?()","genschedulehelper::schedulegenerator::select_mate()","genschedulehelper::mockschedule#set_class_sections()","person::sexes()","completionscontroller#show()","schedulescontroller#show()","genschedulehelper::sort_by_preferences()","person::suffixes()","publiccontroller#terms()","schedulescontroller#tips()","person::titles()","genschedulehelper::mockschedule#unassign_class_section!()","completionscontroller#update()","schedulescontroller#update()","","","","","","","","","","","","","","","","","","","","","","","","","",""],"info":[["ApplicationController","","classes/ApplicationController.html","","<p>The ApplicationController is the superclass for all controllers in the\napplication and can be used to …\n"],["ApplicationHelper","","classes/ApplicationHelper.html","","<p>The ApplicationHelper module contains utility methods which are useful to\nmultiple portions of the application. …\n"],["AutocompleteHelper","","classes/AutocompleteHelper.html","","<p>The AutocompleteHelper module contains a method used to create a variable\nof all courses that can be …\n"],["College","","classes/College.html","","<p>The College class represents the entity college in a university (eg. the\nCollege of Engineering, College …\n"],["Completion","","classes/Completion.html","","<p>The Completion class represents a course which a student has taken,\nrelating a User and Course while …\n"],["CompletionsController","","classes/CompletionsController.html","","<p>The CompletionController is a basic RESTful controller that allow a\nlogged-in user to edit the completed …\n"],["Course","","classes/Course.html","","<p>The Course class provides information about an individual course. Each\ncourse is related to one or more …\n"],["CourseGroup","","classes/CourseGroup.html","","<p>The CourseGroup class holds a set of courses that are evaluated together\nand relate to a users major. …\n"],["FlashHelper","","classes/FlashHelper.html","","<p>Provides a helper method to simplify the display of flash messages and\nprovide the\nnecessary markup for ...\n"],["GenScheduleHelper","","classes/GenScheduleHelper.html","","<p>This module provides interfaces for generating schedule mock-ups using user\npreferences and a set of …\n"],["GenScheduleHelper::MockSchedule","","classes/GenScheduleHelper/MockSchedule.html","","<p>The MockSchedule class represents a simple mock-up of a Schedule&#39;s\ncontent for the purpose of generating …\n"],["GenScheduleHelper::ScheduleGenerator","","classes/GenScheduleHelper/ScheduleGenerator.html","","<p>This ScheduleGenerator class provides some general methods for generating\nsets of schedules based on …\n"],["Location","","classes/Location.html","","<p>The Location class represents the location of a building, storing both its\nstreet address and a spatial …\n"],["Location::RGeo","","classes/Location/RGeo.html","",""],["Person","","classes/Person.html","","<p>The Person class represents a real world person.\n<p>Attributes are stored as follows:\n<p><code>:name</code> stores the name …\n"],["Preference","","classes/Preference.html","","<p>The Preference class represents the preferences expressed by a user. These\ninclude importance of distance, …\n"],["PublicController","","classes/PublicController.html","","<p>The PublicController handles the information about the Webpage. It handles\ninfo about Home,\nAbout page, ...\n"],["RequirementGroup","","classes/RequirementGroup.html","","<p>The RequirementGroup class represents a set of Courses and associates a\ncompletion rule to that Course …\n"],["Schedule","","classes/Schedule.html","","<p>The Schedule class represents a possible schedule for the user. It will be\nscored based on a scheduling …\n"],["SchedulesController","","classes/SchedulesController.html","","<p>The SchedulesController handles requests for generating a new schedule, as\nwell as displaying the results …\n"],["Section","","classes/Section.html","","<p>The Section class represents a single section of a course that is offered\nby the College during a term. …\n"],["Term","","classes/Term.html","","<p>A Term represents a period of time in which a Course may be offered.\n<p>Attributes are stored as follows: …\n"],["User","","classes/User.html","","<p>The User class represents a user in the application, which is understood to\nmean a person seeking to …\n"],["about","PublicController","classes/PublicController.html#method-i-about","()",""],["assign_class_section!","GenScheduleHelper::MockSchedule","classes/GenScheduleHelper/MockSchedule.html#method-i-assign_class_section-21","(class_section)","<p>Adds a class section to the class section set of <code>self</code>.\n<p>Returns:\n<p>The class section set of <code>self</code> if the class …\n"],["autocompleted_course_to_id","ApplicationHelper","classes/ApplicationHelper.html#method-i-autocompleted_course_to_id","(course_string)","<p>The autocompleted_course_to_id method takes a full course string as an\nargument which includes the instructional …\n"],["bias_param","SchedulesController","classes/SchedulesController.html#method-i-bias_param","(parameter, low, high)",""],["bias_slider","ApplicationHelper","classes/ApplicationHelper.html#method-i-bias_slider","(input)","<p>The bias_slider method takes as input the value set on a single slider by a\nuser, ranging from 0 to 1. …\n"],["configure_permitted_parameters","ApplicationController","classes/ApplicationController.html#method-i-configure_permitted_parameters","()","<p>Add parameters to the list of allowed params on the appropriate Devise\ncontrollers in order to facilitate …\n"],["contact","PublicController","classes/PublicController.html#method-i-contact","()",""],["convert_and_clean_up_dates","SchedulesController","classes/SchedulesController.html#method-i-convert_and_clean_up_dates","(parameter)",""],["courses_for_autocomplete","AutocompleteHelper","classes/AutocompleteHelper.html#method-i-courses_for_autocomplete","()","<p>The <code>courses_for_autocomplete</code> method is called in the\n<code>autocomplete.coffee.erb</code> file to obtain an array …\n"],["create","CompletionsController","classes/CompletionsController.html#method-i-create","()","<p>Allows user to create a new Completion\n"],["destroy","CompletionsController","classes/CompletionsController.html#method-i-destroy","()","<p><code>destroy</code> a completion from user history\n"],["display_flash_messages","FlashHelper","classes/FlashHelper.html#method-i-display_flash_messages","(keys = {})","<p>Returns the HTML for pretty display of the flash messages, either in full\nor for the categories specified. …\n"],["edit","CompletionsController","classes/CompletionsController.html#method-i-edit","()","<p><code>edit</code> allows a user to update their completed course grade\n"],["eql?","GenScheduleHelper::MockSchedule","classes/GenScheduleHelper/MockSchedule.html#method-i-eql-3F","(other_schedule)","<p>Overrides Object&#39;s standard <code>eql?</code> method.\n<p>Returns:\n<p><code>true</code> if the set of class sections in <code>self</code> is\nequal …\n"],["evaluate!","GenScheduleHelper::MockSchedule","classes/GenScheduleHelper/MockSchedule.html#method-i-evaluate-21","()","<p>Assigns a score of <code>self</code> based on how well +self fits\npreferences (specified by <code>preferences</code>) the following …\n"],["evaluate_population","GenScheduleHelper::ScheduleGenerator","classes/GenScheduleHelper/ScheduleGenerator.html#method-c-evaluate_population","(schedule_set)","<p>Evaluates the overall fitness of a population as well as the fitness of the\nmost fit individual in a …\n"],["evolve_schedules","GenScheduleHelper::ScheduleGenerator","classes/GenScheduleHelper/ScheduleGenerator.html#method-c-evolve_schedules","(preferences, class_section_set)","<p>Generates a set of somewhat optimal schedules from specified user\npreferences and a set of available …\n"],["exchange_genes!","GenScheduleHelper::ScheduleGenerator","classes/GenScheduleHelper/ScheduleGenerator.html#method-c-exchange_genes-21","(schedule, other_schedule)","<p>Swaps a random number of class sections/genes from one schedule to another\nand vice versa. This is considered …\n"],["fill_schedule!","GenScheduleHelper::MockSchedule","classes/GenScheduleHelper/MockSchedule.html#method-i-fill_schedule-21","(class_section_set)","<p>Fills <code>self</code> with class sections from a set of class sections. A\nfull MockSchedule is one with the number …\n"],["flatten_courses","SchedulesController","classes/SchedulesController.html#method-i-flatten_courses","()",""],["flatten_exclusions","SchedulesController","classes/SchedulesController.html#method-i-flatten_exclusions","()",""],["generate_permutations_of_schedules","GenScheduleHelper::ScheduleGenerator","classes/GenScheduleHelper/ScheduleGenerator.html#method-c-generate_permutations_of_schedules","(preferences, class_section_set)","<p>Generates a set of schedules by way of permutation generation.\nNOTE: For\nlarge sets of class sections, ...\n"],["generate_schedules","GenScheduleHelper::ScheduleGenerator","classes/GenScheduleHelper/ScheduleGenerator.html#method-c-generate_schedules","(preferences, class_section_set)","<p>Generates a limited set of random, valid schedules from a set of available\nclass sections.\nNOTE: This ...\n"],["hash","GenScheduleHelper::MockSchedule","classes/GenScheduleHelper/MockSchedule.html#method-i-hash","()","<p>Overrides Object&#39;s standard <code>hash</code> method.\n<p>Returns:\n<p>A <code>hash</code> representation of the class sections found …\n"],["home","PublicController","classes/PublicController.html#method-i-home","()","<p>Routes to the home page for PublicController\n"],["index","CompletionsController","classes/CompletionsController.html#method-i-index","()","<p><code>index</code> shows all of the completions for a given user\n"],["index","SchedulesController","classes/SchedulesController.html#method-i-index","()","<p>Routes to the home page for SchedulesController\n"],["is_valid?","GenScheduleHelper::MockSchedule","classes/GenScheduleHelper/MockSchedule.html#method-i-is_valid-3F","()","<p>Checks if <code>self</code> is a valid representation of a Schedule based\non <code>preferences</code>.\n<p>Returns:\n<p><code>true</code> if the following …\n"],["mutate!","GenScheduleHelper::ScheduleGenerator","classes/GenScheduleHelper/ScheduleGenerator.html#method-c-mutate-21","(schedule, class_section_set)","<p>Randomly replaces class sections/genes in a schedule with class\nsections/genes from a pool of available …\n"],["new","CompletionsController","classes/CompletionsController.html#method-i-new","()","<p><code>new</code> allows a user to create a new completion\n"],["new","GenScheduleHelper::MockSchedule","classes/GenScheduleHelper/MockSchedule.html#method-c-new","(preferences)","<p>Initialize an empty MockSchedule with a set of user preferences.\n<p>Parameters:\n<p><code>preferences</code> - The <code>hstore</code> preferences …\n"],["new_generation!","GenScheduleHelper::ScheduleGenerator","classes/GenScheduleHelper/ScheduleGenerator.html#method-c-new_generation-21","(schedule_set, class_section_set)","<p>Creates a new schedule set/population, using the following steps.\n * Select\na mate for an individual. ...\n"],["privacy","PublicController","classes/PublicController.html#method-i-privacy","()",""],["purge_and_replace_invalid_schedules!","GenScheduleHelper::ScheduleGenerator","classes/GenScheduleHelper/ScheduleGenerator.html#method-c-purge_and_replace_invalid_schedules-21","(schedule_set, class_section_set)","<p>Finds invalid schedules in a population and removes them, replacing them\nwith random and valid schedules. …\n"],["reset!","GenScheduleHelper::MockSchedule","classes/GenScheduleHelper/MockSchedule.html#method-i-reset-21","(class_section_set)","<p>Resets <code>self</code>&#39;s class section set with a new, random, and\nfull class section set. Reset also evaluates …\n"],["run_schedules","SchedulesController","classes/SchedulesController.html#method-i-run_schedules","()",""],["safe_assignment?","GenScheduleHelper::MockSchedule","classes/GenScheduleHelper/MockSchedule.html#method-i-safe_assignment-3F","(class_section)","<p>Checks if <code>class_section</code> is able to be added to\n<code>self</code> based on the contents of <code>self</code>&#39;s class\nsection …\n"],["select_mate","GenScheduleHelper::ScheduleGenerator","classes/GenScheduleHelper/ScheduleGenerator.html#method-c-select_mate","(schedule, schedule_set)","<p>Selects the next most fit schedule or with some low probability, a random\nschedule from <code>schedule_set</code> …\n"],["set_class_sections","GenScheduleHelper::MockSchedule","classes/GenScheduleHelper/MockSchedule.html#method-i-set_class_sections","(class_section_set)","<p>Replaces <code>self</code>&#39;s class section set with that of\n<code>class_section_set</code>. This does <em>not</em> guarantee that\n<code>self</code> …\n"],["sexes","Person","classes/Person.html#method-c-sexes","()","<p>Gets the set of sexes which are valid\n<p>Returns:\n<p>an array of sexes which will be accepted by the inclusion …\n"],["show","CompletionsController","classes/CompletionsController.html#method-i-show","()","<p><code>show</code> displays a single completion to the user\n"],["show","SchedulesController","classes/SchedulesController.html#method-i-show","()","<p>Sets preferences for a user and displays the appropriate view\n"],["sort_by_preferences","GenScheduleHelper","classes/GenScheduleHelper.html#method-c-sort_by_preferences","(preferences, schedule_set)","<p>Sorts a set of schedules based on user preferences in a relative manner.\n<p>Returns:\n<p>A sorted array of schedules. …\n"],["suffixes","Person","classes/Person.html#method-c-suffixes","()","<p>Gets the set of words which are valid suffixes\n<p>Returns:\n<p>an array of suffixes which will be accepted by …\n"],["terms","PublicController","classes/PublicController.html#method-i-terms","()",""],["tips","SchedulesController","classes/SchedulesController.html#method-i-tips","()","<p>The <code>tips</code> method simply displays text to a user to remind them\nthat having less restrictions will allow …\n"],["titles","Person","classes/Person.html#method-c-titles","()","<p>Gets the set of words which are valid titles\n<p>Returns:\n<p>an array of titles which will be accepted by the …\n"],["unassign_class_section!","GenScheduleHelper::MockSchedule","classes/GenScheduleHelper/MockSchedule.html#method-i-unassign_class_section-21","(class_section)","<p>Removes a class section from the class section set of <code>self</code>.\n<p>Returns:\n<p>The class section set of <code>self</code> if the …\n"],["update","CompletionsController","classes/CompletionsController.html#method-i-update","()","<p>Allows user to update their Completion information\n"],["update","SchedulesController","classes/SchedulesController.html#method-i-update","()","<p>Updates the score of the algorithm if a user chooses to change their\npreferences\n"],["Gemfile","","files/Gemfile.html","","<p>source &#39;rubygems.org&#39;\n<p># Travis CI requirement; probably not bad to have here anyway gem\n&#39;rake&#39; …\n"],["Gemfile.lock","","files/Gemfile_lock.html","","<p>GEM\n\n<pre><code>remote: https://rubygems.org/\nspecs:\n  actionmailer (4.1.4)\n    actionpack (= 4.1.4)\n    actionview ...</code></pre>\n"],["README","","files/README_md.html","","<p><img src=\"https://codeclimate.com/github/jimcavoli/College-Reaper.png\"> <img src=\"https://travis-ci.org/jimcavoli/College-Reaper.svg?branch=master\"> …\n"],["Rakefile","","files/Rakefile.html","","<p># Add your own tasks in files placed in lib/tasks ending in .rake, # for\nexample lib/tasks/capistrano.rake …\n"],["application.coffee","","files/app/assets/javascripts/application_coffee.html","","<p># This is a manifest file that&#39;ll be compiled into application.js,\nwhich will include all the files …\n"],["application.scss","","files/app/assets/stylesheets/application_scss.html","","\n<pre><code>This is a manifest file that&#39;ll be compiled into application.css, which will include all the files\nlisted ...</code></pre>\n"],["autocomplete.scss","","files/app/assets/stylesheets/autocomplete_scss.html","","<p>@import &#39;foundation_and_overrides&#39;;\n<p>.twitter-typeahead {\n\n<pre><code>width: 100%;</code></pre>\n"],["foundation_and_overrides.scss","","files/app/assets/stylesheets/foundation_and_overrides_scss.html","","<p>// Foundation by ZURB // foundation.zurb.com // Licensed under MIT Open\nSource\n<p>// // FOUNDATION SETTINGS …\n"],["schedule_display.scss","","files/app/assets/stylesheets/schedule_display_scss.html","","<p>.block { height: 100px; margin-top: 25px; } .block1 { height: 100px;\nmargin-top: 150px; } .space { margin-bottom: …\n"],["application.css","","files/coverage/assets/0_8_0/application_css.html","","\n<pre><code>  -----------------------------------------------------------------------\n\nBlueprint CSS Framework 0.9 ...</code></pre>\n"],["application.js","","files/coverage/assets/0_8_0/application_js.html","","\n<pre><code>!\n jQuery JavaScript Library v1.6.2\n http://jquery.com/\n\n Copyright 2011, John Resig\n Dual licensed under ...</code></pre>\n"],["index.html","","files/coverage/index_html.html","","<p>&lt;!DOCTYPE html&gt; &lt;html xmlns=&#39;www.w3.org/1999/xhtml&#39;&gt;\n\n<pre><code>&lt;head&gt;\n  &lt;title&gt;Code coverage ...</code></pre>\n"],["404.html","","files/public/404_html.html","","<p>&lt;!DOCTYPE html&gt; &lt;html&gt; &lt;head&gt;\n\n<pre><code>&lt;title&gt;The page you were looking for doesn&#39;t exist (404)&lt;/title&gt; ...</code></pre>\n"],["422.html","","files/public/422_html.html","","<p>&lt;!DOCTYPE html&gt; &lt;html&gt; &lt;head&gt;\n\n<pre><code>&lt;title&gt;The change you wanted was rejected (422)&lt;/title&gt; ...</code></pre>\n"],["500.html","","files/public/500_html.html","","<p>&lt;!DOCTYPE html&gt; &lt;html&gt; &lt;head&gt;\n\n<pre><code>&lt;title&gt;We&#39;re sorry, but something went wrong (500)&lt;/title&gt; ...</code></pre>\n"],["favicon.ico","","files/public/favicon_ico.html","",""],["robots","","files/public/robots_txt.html","","<p>See www.robotstxt.org/robotstxt.html for documentation on how to use the\nrobots.txt file\n<p>To ban all spiders …\n"],["rich.html","","files/tmp/letter_opener/1406501314_302a742/rich_html.html","","<p>&lt;html&gt;\n\n<pre><code>&lt;head&gt;\n  &lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=UTF-8&quot;&gt;\n\n    &lt;title&gt;Confirmation ...</code></pre>\n"],["rich.html","","files/tmp/letter_opener/1406506506_930d75f/rich_html.html","","<p>&lt;html&gt;\n\n<pre><code>&lt;head&gt;\n  &lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=UTF-8&quot;&gt;\n\n    &lt;title&gt;Confirmation ...</code></pre>\n"],["rich.html","","files/tmp/letter_opener/1406521670_e8988e9/rich_html.html","","<p>&lt;html&gt;\n\n<pre><code>&lt;head&gt;\n  &lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=UTF-8&quot;&gt;\n\n    &lt;title&gt;Confirmation ...</code></pre>\n"],["rich.html","","files/tmp/letter_opener/1406525497_871440e/rich_html.html","","<p>&lt;html&gt;\n\n<pre><code>&lt;head&gt;\n  &lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=UTF-8&quot;&gt;\n\n    &lt;title&gt;Confirmation ...</code></pre>\n"],["rich.html","","files/tmp/letter_opener/1406526044_2e15993/rich_html.html","","<p>&lt;html&gt;\n\n<pre><code>&lt;head&gt;\n  &lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=UTF-8&quot;&gt;\n\n    &lt;title&gt;Confirmation ...</code></pre>\n"],["rich.html","","files/tmp/letter_opener/1406681153_717c495/rich_html.html","","<p>&lt;html&gt;\n\n<pre><code>&lt;head&gt;\n  &lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=UTF-8&quot;&gt;\n\n    &lt;title&gt;Confirmation ...</code></pre>\n"],["rich.html","","files/tmp/letter_opener/1406684286_14e1f77/rich_html.html","","<p>&lt;html&gt;\n\n<pre><code>&lt;head&gt;\n  &lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=UTF-8&quot;&gt;\n\n    &lt;title&gt;Reset ...</code></pre>\n"],["rich.html","","files/tmp/letter_opener/1406684363_565617f/rich_html.html","","<p>&lt;html&gt;\n\n<pre><code>&lt;head&gt;\n  &lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=UTF-8&quot;&gt;\n\n    &lt;title&gt;Confirmation ...</code></pre>\n"],["rich.html","","files/tmp/letter_opener/1406729075_deb9a03/rich_html.html","","<p>&lt;html&gt;\n\n<pre><code>&lt;head&gt;\n  &lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=UTF-8&quot;&gt;\n\n    &lt;title&gt;Confirmation ...</code></pre>\n"]]}}