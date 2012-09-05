package com.cjm.game.ai.behaviors.steering 
{
	/**
	 * ...
	 * @author Colton Murphy
	 */
	import com.cjm.game.ai.agent.IAgent;
	import com.cjm.game.ai.behaviors.Behavior;
	import com.cjm.game.core.IGameMovingEntity;
	import flash.geom.Vector3D;
	
	internal class Interpose extends Behavior
	{
		protected var _agentA :IGameMovingEntity;
		protected var _agentB :IGameMovingEntity;// B and C interposes A
		protected var _agentC :IGameMovingEntity;
		
		protected var _midpoint:Vector3D;
		protected var _timeToReachMidpoint:Number;
		protected var _furturePosB:Vector3D;
		protected var _furturePosC:Vector3D;
		
		override public function enter( ...params ) :Boolean
		{
			super.enter(params);
			
			_agentA  = params[0] as IGameMovingEntity;
			_agentB = params[1] as IGameMovingEntity;
			_agentC = params[1] as IGameMovingEntity;
			
			//TODO: Record enter data
			
			return _agentA && _agentB && _agentC;
		}
		
		override public function exit( ...params ) :Boolean
		{
			super.exit(params);
			
			//TODO: Record exit data
			
			
			return _agentA && _agentB && _agentC;
		}
		
		override public function execute( ...params ) :Vector3D
		{
			super.execute(params);
			
			_midpoint = ( _agentB.getPosition().add(_agentC.getPosition()) ).scaleBy( 0.5 );
			_timeToReachMidpoint = _agentA.getDistance( _midpoint ) / _agentA.getMaxSpeed();
			_furturePosB = _agentB.getPosition().add(_agentB.getVelocity()).scaleBy(_timeToReachMidpoint);
			_furturePosC = _agentC.getPosition().add(_agentC.getVelocity()).scaleBy(_timeToReachMidpoint);
			
			//Midpoint of predicted positions
			_midpoint = _furturePosB.add( _furturePosC).scaleBy( 0.5 );
			
			var howFast:Number = 2;
			
			return new Arrive().execute(_midpoint, howFast);
		}
		
	}
}