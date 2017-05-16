
type 'a set =
  | Set of 'a list;;

let empty = Set [];;

let s0 = empty;;

let (_,_) = ((List.mem 1 s0), (List.mem 2 s0));;
