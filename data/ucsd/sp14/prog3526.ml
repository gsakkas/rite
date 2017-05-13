
let rec pipe fs =
  let fsrev = List.rev fs in
  match fsrev with | x::[] -> x | h::t -> h (pipe t);;
