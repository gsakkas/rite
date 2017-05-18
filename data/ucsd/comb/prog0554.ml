
let long_list =
  let rec assemble n l =
    if n < 1000000 then (assemble (n + 1) (n, (string_of_int n))) :: l else l in
  assemble 1 [];;
