
type 'a set =
  | Set of 'a list;;

let empty = Set [0; 0];;

let s0 = empty;;

let (_,_) = ((List.mem 1 s0), (List.mem 2 s0));;
