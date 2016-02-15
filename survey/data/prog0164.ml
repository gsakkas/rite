(* `append xs ys` returns a list containing the elements of `xs`
   followed by the elements of `ys` *)

let append xs ys =
  match xs with
  | []   -> ys
  | h::t -> h :: t :: ys

let _ = append [1] [2]
