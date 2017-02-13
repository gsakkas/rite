
(* ####################################################################
#############################################################################
 *)

exception CouldBeAnything

(* ################################################### *)
type 'a t1 = { ctr1   : 'a;
               incr1  : 'a -> unit;
	       allowDecr1 : 'a -> unit;
               decr1  : 'a -> unit;
               print1 : 'a -> unit }

(* ###################### *)
let client1 (impl : 'a t1) =
  impl.decr1 impl.ctr1; impl.print1 impl.ctr1; 1

(* ####################### *)
type 'a t2 = { ctr2   : 'a;
               incr2  : 'a -> unit;
	       allowDecr2 : 'a -> ('a -> unit);
               print2 : 'a -> unit }

let client2 (impl : 'a t2) =
        let decr = impl.allowDecr2 in
   decr impl.ctr2; impl.print2 impl.ctr1; 1

(* ###################### *)

type ('a,'b) t3 = { ctr3 : 'a;
                    incr3 : 'a -> unit;
		    allowDecr3 : 'a -> 'b;
                    decr3 : 'b -> unit;
                    print3 : 'a -> unit}

let client3 (funs : ('a,'b) t3) =
  raise CouldBeAnything

