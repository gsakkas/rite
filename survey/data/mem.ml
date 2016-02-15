(* `mem x l` should return `true` if `x` is an element of `l`, and
   `false` otherwise. *)

let mem x l =
  match x with
  | []     -> false
  | hd::tl -> x = hd

let _ = mem "cat" ["dog"]
