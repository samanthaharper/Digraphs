#############################################################################
##
#W  attrs.tst
#Y  Copyright (C) 2014                                   James D. Mitchell
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##

gap> START_TEST("Digraphs package: attrs.tst");
gap> LoadPackage("digraphs", false);;

#
gap> DigraphsStartTest();

# AdjacencyMatrix
gap> gr:=DirectedGraph(rec(vertices:=[1..10], 
> source:=[1,1,1,1,1,1,1,1], range:=[2,2,3,3,4,4,5,5]));
<directed graph with 10 vertices, 8 edges>
gap> AdjacencyMatrix(gr);
[ [ 0, 2, 2, 2, 2, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]

# AdjacencyMatrix, testing before and after getting IsSimple and Adjacencies
# (with a simple digraph)
gap> r:=rec(vertices:=[1..7],
> source:=[1,1,2,2,3,4,4,5,6,7],
> range:=[3,4,2,4,6,6,7,2,7,5]);
rec( range := [ 3, 4, 2, 4, 6, 6, 7, 2, 7, 5 ], 
  source := [ 1, 1, 2, 2, 3, 4, 4, 5, 6, 7 ], vertices := [ 1 .. 7 ] )
gap> gr := DirectedGraph(r);
<directed graph with 7 vertices, 10 edges>
gap> adj1 := AdjacencyMatrix(gr);
[ [ 0, 0, 1, 1, 0, 0, 0 ], [ 0, 1, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], 
  [ 0, 0, 0, 0, 0, 1, 1 ], [ 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1 ], 
  [ 0, 0, 0, 0, 1, 0, 0 ] ]
gap> gr := DirectedGraph(r);
<directed graph with 7 vertices, 10 edges>
gap> IsSimpleDirectedGraph(gr);
true
gap> Adjacencies(gr);
[ [ 3, 4 ], [ 2, 4 ], [ 6 ], [ 6, 7 ], [ 2 ], [ 7 ], [ 5 ] ]
gap> adj2 := AdjacencyMatrix(gr);
[ [ 0, 0, 1, 1, 0, 0, 0 ], [ 0, 1, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], 
  [ 0, 0, 0, 0, 0, 1, 1 ], [ 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1 ], 
  [ 0, 0, 0, 0, 1, 0, 0 ] ]
gap> adj1 = adj2;
true

# AdjacencyMatrix, testing before and after getting IsSimple and Adjacencies
# (with a not simple digraph)
gap> r:=rec(vertices:=[1..1], source:=[1,1], range:=[1,1]);
rec( range := [ 1, 1 ], source := [ 1, 1 ], vertices := [ 1 ] )
gap> gr := DirectedGraph(r);
<directed graph with 1 vertices, 2 edges>
gap> adj1 := AdjacencyMatrix(gr);
[ [ 2 ] ]
gap> gr := DirectedGraph(r);
<directed graph with 1 vertices, 2 edges>
gap> IsSimpleDirectedGraph(gr);
false
gap> adj2 := AdjacencyMatrix(gr);
[ [ 2 ] ]
gap> adj1 = adj2;
true

#
gap> DigraphsStopTest();

#
gap> STOP_TEST( "Digraphs package: attrs.tst", 0);