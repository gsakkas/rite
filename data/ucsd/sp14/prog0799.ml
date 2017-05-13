
let rev list =
  let rec aux acc = function | [] -> acc | h::t -> aux (h :: acc) h in
  aux [] list;;
