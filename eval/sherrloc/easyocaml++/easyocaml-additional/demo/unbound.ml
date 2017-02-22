

let append_char str c =
  str ^ string_of_char c

let pluralize noun =
  append_to_char noun 's'

let rough_description_of_an_array name arr =
  if Array.length arr = 0 then
    print_endline "nothing"
  else if Array.length arr = 1 then
    print_endline ("Only one " ^ name)
  else
    print_endline ("There are many " ^ pluralise name)

