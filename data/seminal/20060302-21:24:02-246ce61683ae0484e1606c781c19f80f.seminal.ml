
exception Unimplemented

let char2str c = String.make 1 c

(* ################################################## *)

let reverse str = 
  let rec loop ostr nstr cur =
	if cur = (String.length ostr) then nstr
	else
	(
		nstr <- (Char.escaped ostr.[cur]) ^ nstr;
		loop ostr nstr (cur + 1)
	)  
  in loop str "" 0  

let fold_left f init str =
  raise Unimplemented

let fold_right f str init =
  raise Unimplemented

let map f str =
  raise Unimplemented


let uppercase s =
  raise Unimplemented

let lowercase s =
  raise Unimplemented

let titlecase s =
  raise Unimplemented
    
let histogram s =
  raise Unimplemented
