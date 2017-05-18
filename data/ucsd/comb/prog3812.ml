
let listReverse l =
  let rec reverseHelper l rl =
    function | [] -> rl | h::t -> reverseHelper t (h :: rl) in
  reverseHelper l [];;
