
let listReverse l =
  let rec rev x = function | [] -> x | h::t -> rev (h :: x) t in rev [] l;;

let listReverse l =
  let x = [] in match l with | h::t -> h :: x | _ -> listReverse x;;

let listReverse l =
  let x = [] in match l with | h::t -> listReverse t | h::[] -> h :: x;;

let listReverse l =
  let x = [] in match l with | h::t -> listReverse t | h -> h :: x;;
