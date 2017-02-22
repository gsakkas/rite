(*S*)
let m : ('a -> 'b) -> 'a list -> 'b list = List.map
let i : ('a -> unit) -> 'a list -> unit = List.iter
let m : 'a -> 'a list -> bool = List.mem

let a : unit -> float = fun () -> Random.float 1.0

open List
open Random
let m : ('a -> 'b) -> 'a list -> 'b list = map
let i : ('a -> unit) -> 'a list -> unit = iter
let m : 'a -> 'a list -> bool = mem

let a : unit -> float = fun () -> float 1.0

