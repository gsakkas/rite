
let rec wwhile (f,b) =
  let i = b in
  match f i with | (v_n,false ) -> v_n | (v_n,true ) -> wwhile (f, v_n);;

let fixpoint (f,b) =
  let f' fo b' = if (fo b') = b' then (b', true) else ((fo b'), false) in
  wwhile (f', b);;
