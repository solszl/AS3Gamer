﻿package com.cjm.game.graph{	import com.cjm.game.core.IRender;	import com.cjm.math.geom.Vector2D;	import flash.display.DisplayObject;	import flash.display.Shape;	import com.cjm.game.ai.pathfinding.INode;		public class NavGraphNode extends GraphNode	{		private var _position:Vector2D;		private var _extraInfo:*;				public function NavGraphNode( index:int, position:Vector2D )		{			super( index );						_position = position;		}		        public function setPosition(v:Vector2D):Vector2D 		{			_position = v;		}		public function getPosition():Vector2D 		{			return _position;		}				public function setExtraInfo( i:* ):void 		{			_extraInfo = i;		}		public function getExtraInfo():* 		{			return _extraInfo;		}				override public function equals(other:GraphNode):Boolean		{			return getPosition().equals( other.getPosition() );		}	}}