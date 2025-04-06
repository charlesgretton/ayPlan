(define (domain ytilanoitisoporp)
(:requirements :action-costs :typing)
(:types boolean - object)
(:predicates (on ?b - boolean)
(off ?b - boolean)
(related ?b1 ?b2 - boolean)
(unrelated ?b - boolean))
(:functions (total-cost) - number
(switch-cost ?b - boolean) - number )
(:action switch-on
:parameters (?b1 ?b2 - boolean)
:precondition (and (off ?b1) (related ?b1 ?b2) )
:effect (and (not (off ?b1)) 
(off ?b2)
 (not (on ?b2))
(on ?b1)
(increase (total-cost) (switch-cost ?b1))
)
)
(:action unrelated-switch-on
:parameters (?b - boolean)
:precondition (and (off ?b) (unrelated ?b) )
:effect (and (not (off ?b)) 
(on ?b)
(increase (total-cost) (switch-cost ?b))
)
)
(:action switch-off
:parameters (?b - boolean)
:precondition (and (on ?b) )
:effect (and (not (on ?b))
(off ?b)
(increase (total-cost) (switch-cost ?b))
)
)
(:action super-switch
:parameters ()
:precondition ()
:effect (and 
(not (on o1 ))
(off o1 )
(not (on o2 ))
(off o2 )
(not (on o3 ))
(off o3 )
(on o4 )
(not (off o4 ))
(on o5 )
(not (off o5 ))
(on o6 )
(not (off o6 ))
(not (on o7 ))
(off o7 )
(on o8 )
(not (off o8 ))
(on o9 )
(not (off o9 ))
(not (on o10 ))
(off o10 )
(on o11 )
(not (off o11 ))
(on o12 )
(not (off o12 ))
(not (on o13 ))
(off o13 )
(on o14 )
(not (off o14 ))
(not (on o15 ))
(off o15 )
(on o16 )
(not (off o16 ))
(on o17 )
(not (off o17 ))
(not (on o18 ))
(off o18 )
(on o19 )
(not (off o19 ))
(not (on o20 ))
(off o20 )
(on o21 )
(not (off o21 ))
(not (on o22 ))
(off o22 )
(on o23 )
(not (off o23 ))
(not (on o24 ))
(off o24 )
(on o25 )
(not (off o25 ))
(not (on o26 ))
(off o26 )
(on o27 )
(not (off o27 ))
(not (on o28 ))
(off o28 )
(on o29 )
(not (off o29 ))
(not (on o30 ))
(off o30 )
(on o31 )
(not (off o31 ))
(not (on o32 ))
(off o32 )
(on o33 )
(not (off o33 ))
(not (on o34 ))
(off o34 )
(not (on o35 ))
(off o35 )
(on o36 )
(not (off o36 ))
(not (on o37 ))
(off o37 )
(on o38 )
(not (off o38 ))
(on o39 )
(not (off o39 ))
(on o40 )
(not (off o40 ))
(not (on o41 ))
(off o41 )
(on o42 )
(not (off o42 ))
(on o43 )
(not (off o43 ))
(on o44 )
(not (off o44 ))
(not (on o45 ))
(off o45 )
(on o46 )
(not (off o46 ))
(not (on o47 ))
(off o47 )
(not (on o48 ))
(off o48 )
(not (on o49 ))
(off o49 )
(not (on o50 ))
(off o50 )
(on o51 )
(not (off o51 ))
(not (on o52 ))
(off o52 )
(on o53 )
(not (off o53 ))
(on o54 )
(not (off o54 ))
(not (on o55 ))
(off o55 )
(on o56 )
(not (off o56 ))
(on o57 )
(not (off o57 ))
(not (on o58 ))
(off o58 )
(on o59 )
(not (off o59 ))
(on o60 )
(not (off o60 ))
(on o61 )
(not (off o61 ))
(on o62 )
(not (off o62 ))
(on o63 )
(not (off o63 ))
(not (on o64 ))
(off o64 )
(not (on o65 ))
(off o65 )
(not (on o66 ))
(off o66 )
(not (on o67 ))
(off o67 )
(on o68 )
(not (off o68 ))
(on o69 )
(not (off o69 ))
(on o70 )
(not (off o70 ))
(on o71 )
(not (off o71 ))
(not (on o72 ))
(off o72 )
(on o73 )
(not (off o73 ))
(not (on o74 ))
(off o74 )
(on o75 )
(not (off o75 ))
(not (on o76 ))
(off o76 )
(not (on o77 ))
(off o77 )
(not (on o78 ))
(off o78 )
(on o79 )
(not (off o79 ))
(on o80 )
(not (off o80 ))
(on o81 )
(not (off o81 ))
(not (on o82 ))
(off o82 )
(not (on o83 ))
(off o83 )
(not (on o84 ))
(off o84 )
(not (on o85 ))
(off o85 )
(on o86 )
(not (off o86 ))
(not (on o87 ))
(off o87 )
(not (on o88 ))
(off o88 )
(not (on o89 ))
(off o89 )
(not (on o90 ))
(off o90 )
(on o91 )
(not (off o91 ))
(on o92 )
(not (off o92 ))
(not (on o93 ))
(off o93 )
(on o94 )
(not (off o94 ))
(not (on o95 ))
(off o95 )
(on o96 )
(not (off o96 ))
(not (on o97 ))
(off o97 )
(on o98 )
(not (off o98 ))
(not (on o99 ))
(off o99 )
(not (on o100 ))
(off o100 )
(increase (total-cost) 100000))) 
)
