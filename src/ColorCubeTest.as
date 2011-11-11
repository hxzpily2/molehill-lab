package  
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import com.adobe.utils.AGALMiniAssembler;
	import com.adobe.utils.PerspectiveMatrix3D;
	import flash.display3D.textures.CubeTexture;
	import geom.RawConst;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage3D;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display3D.Context3D;
	import flash.display3D.Context3DProgramType;
	import flash.display3D.Context3DTextureFormat;
	import flash.display3D.Context3DTriangleFace;
	import flash.display3D.Context3DVertexBufferFormat;
	import flash.display3D.IndexBuffer3D;
	import flash.display3D.Program3D;
	import flash.display3D.VertexBuffer3D;
	import flash.display3D.textures.Texture;
	import flash.events.Event;
	import flash.geom.Matrix3D;
	import flash.geom.Rectangle;
	import flash.geom.Vector3D;
	import flash.sampler.getSize;
	/**
	 * ...
	 * @author Physwf
	 */
	public class ColorCubeTest extends MovieClip 
	{
		private var context3D:Context3D;
		private var program:Program3D;
		private var unitMatrix:Matrix3D;
		private var vertexBuffer:VertexBuffer3D;
		private var texture:Texture;
		private var cubeTexture:CubeTexture;
		private var indexBuffer:IndexBuffer3D;
		[Embed(source="texture/flower.png")]
		private var Flower:Class;
		
		public function ColorCubeTest() 
		{
			stage.stage3Ds[0].addEventListener(Event.CONTEXT3D_CREATE,init);
			stage.stage3Ds[0].requestContext3D();
			super();
		}
		
		private function init(e:Event):void
		{
			var stage3D:Stage3D=e.target as Stage3D;
			//stage3D.viewPort=new Rectangle(0,0,800,600);
			context3D=stage3D.context3D;
			context3D.configureBackBuffer(800,600,8,true);
			
			vertexBuffer=context3D.createVertexBuffer(24,6);
			//vertexBuffer=context3D.createVertexBuffer(32,6);
			indexBuffer=context3D.createIndexBuffer(36);
			
			var vertexData:Vector.<Number> = RawConst.cubeVertex;
			
			var indexData:Vector.<uint> = RawConst.cubeIndex;
			
			
			vertexBuffer.uploadFromVector(vertexData,0,24);
			
			
			indexBuffer.uploadFromVector(indexData,0,36);
			
			program=context3D.createProgram();
			var vertexAssembler:AGALMiniAssembler=new AGALMiniAssembler();
			var fragmAssembler:AGALMiniAssembler=new AGALMiniAssembler();
			var vertexSrc:String=
				"m44 vt0, va0, vc124\n" +
				"m44 op, vt0, vc4\n"+
				"mov v0 ,va1";
			var fragmSrc:String=
			"tex ft0,v0,fs0<cube,linear,clamp>\n" +
			"mov oc ,ft0\n";//"mov oc ,v0 \n";
			vertexAssembler.assemble(Context3DProgramType.VERTEX,vertexSrc);
			fragmAssembler.assemble(Context3DProgramType.FRAGMENT,fragmSrc);
			var flower:Bitmap=new Flower() as Bitmap;
			trace(getSize(texture))
			cubeTexture = context3D.createCubeTexture(256, Context3DTextureFormat.BGRA,true);
			//texture=context3D.createTexture(256,256,Context3DTextureFormat.BGRA,false);
			trace(getSize(texture))
			//texture.uploadFromBitmapData(flower.bitmapData,0);
			//cubeTexture.uploadFromBitmapData(flower.bitmapData, 0, 0);
			//cubeTexture.uploadFromBitmapData(flower.bitmapData, 1, 0);
			//cubeTexture.uploadFromBitmapData(flower.bitmapData, 2, 0);
			//cubeTexture.uploadFromBitmapData(flower.bitmapData, 3, 0);
			//cubeTexture.uploadFromBitmapData(flower.bitmapData, 4, 0);
			//cubeTexture.uploadFromBitmapData(flower.bitmapData, 5, 0);
			
			cubeTexture.uploadFromBitmapData(new BitmapData(256, 256, false, 0xFFFFFFFF*Math.random()), 0, 0);
			cubeTexture.uploadFromBitmapData(new BitmapData(256, 256, false, 0xFFFFFFFF*Math.random()), 1, 0);
			cubeTexture.uploadFromBitmapData(new BitmapData(256, 256, false, 0xFFFFFFFF*Math.random()), 2, 0);
			cubeTexture.uploadFromBitmapData(new BitmapData(256, 256, false, 0xFFFFFFFF*Math.random()), 3, 0);
			cubeTexture.uploadFromBitmapData(new BitmapData(256, 256, false, 0xFFFFFFFF*Math.random()), 4, 0);
			cubeTexture.uploadFromBitmapData(new BitmapData(256, 256, false, 0xFFFFFFFF*Math.random()), 5, 0);
			
			
			cubeTexture.uploadFromBitmapData(new BitmapData(128, 128, false, 0xFFFFFFFF*Math.random()), 0, 1);
			cubeTexture.uploadFromBitmapData(new BitmapData(128, 128, false, 0xFFFFFFFF*Math.random()), 1, 1);
			cubeTexture.uploadFromBitmapData(new BitmapData(128, 128, false, 0xFFFFFFFF*Math.random()), 2, 1);
			cubeTexture.uploadFromBitmapData(new BitmapData(128, 128, false, 0xFFFFFFFF*Math.random()), 3, 1);
			cubeTexture.uploadFromBitmapData(new BitmapData(128, 128, false, 0xFFFFFFFF*Math.random()), 4, 1);
			cubeTexture.uploadFromBitmapData(new BitmapData(128, 128, false, 0xFFFFFFFF*Math.random()), 5, 1);
			
			
			cubeTexture.uploadFromBitmapData(new BitmapData(64, 64, false, 0xFFFFFFFF*Math.random()), 0, 2);
			cubeTexture.uploadFromBitmapData(new BitmapData(64, 64, false, 0xFFFFFFFF*Math.random()), 1, 2);
			cubeTexture.uploadFromBitmapData(new BitmapData(64, 64, false, 0xFFFFFFFF*Math.random()), 2, 2);
			cubeTexture.uploadFromBitmapData(new BitmapData(64, 64, false, 0xFFFFFFFF*Math.random()), 3, 2);
			cubeTexture.uploadFromBitmapData(new BitmapData(64, 64, false, 0xFFFFFFFF*Math.random()), 4, 2);
			cubeTexture.uploadFromBitmapData(new BitmapData(64, 64, false, 0xFFFFFFFF*Math.random()), 5, 0);
			
			cubeTexture.uploadFromBitmapData(new BitmapData(32, 32, false, 0xFFFFFFFF*Math.random()), 0, 3);
			cubeTexture.uploadFromBitmapData(new BitmapData(32, 32, false, 0xFFFFFFFF*Math.random()), 1, 3);
			cubeTexture.uploadFromBitmapData(new BitmapData(32, 32, false, 0xFFFFFFFF*Math.random()), 2, 3);
			cubeTexture.uploadFromBitmapData(new BitmapData(32, 32, false, 0xFFFFFFFF*Math.random()), 3, 3);
			cubeTexture.uploadFromBitmapData(new BitmapData(32, 32, false, 0xFFFFFFFF*Math.random()), 4, 3);
			cubeTexture.uploadFromBitmapData(new BitmapData(32, 32, false, 0xFFFFFFFF*Math.random()), 5, 3);
			
			cubeTexture.uploadFromBitmapData(new BitmapData(16, 16, false, 0xFFFFFFFF*Math.random()), 0, 4);
			cubeTexture.uploadFromBitmapData(new BitmapData(16, 16, false, 0xFFFFFFFF*Math.random()), 1, 4);
			cubeTexture.uploadFromBitmapData(new BitmapData(16, 16, false, 0xFFFFFFFF*Math.random()), 2, 4);
			cubeTexture.uploadFromBitmapData(new BitmapData(16, 16, false, 0xFFFFFFFF*Math.random()), 3, 4);
			cubeTexture.uploadFromBitmapData(new BitmapData(16, 16, false, 0xFFFFFFFF*Math.random()), 4, 4);
			cubeTexture.uploadFromBitmapData(new BitmapData(16, 16, false, 0xFFFFFFFF*Math.random()), 5, 4);
			
			cubeTexture.uploadFromBitmapData(new BitmapData(8, 8, false, 0xFFFFFFFF*Math.random()), 0, 5);
			cubeTexture.uploadFromBitmapData(new BitmapData(8, 8, false, 0xFFFFFFFF*Math.random()), 1, 5);
			cubeTexture.uploadFromBitmapData(new BitmapData(8, 8, false, 0xFFFFFFFF*Math.random()), 2, 5);
			cubeTexture.uploadFromBitmapData(new BitmapData(8, 8, false, 0xFFFFFFFF*Math.random()), 3, 5);
			cubeTexture.uploadFromBitmapData(new BitmapData(8, 8, false, 0xFFFFFFFF*Math.random()), 4, 5);
			cubeTexture.uploadFromBitmapData(new BitmapData(8, 8, false, 0xFFFFFFFF*Math.random()), 5, 5);
			
			cubeTexture.uploadFromBitmapData(new BitmapData(4, 4, false, 0xFFFFFFFF*Math.random()), 0, 6);
			cubeTexture.uploadFromBitmapData(new BitmapData(4, 4, false, 0xFFFFFFFF*Math.random()), 1, 6);
			cubeTexture.uploadFromBitmapData(new BitmapData(4, 4, false, 0xFFFFFFFF*Math.random()), 2, 6);
			cubeTexture.uploadFromBitmapData(new BitmapData(4, 4, false, 0xFFFFFFFF*Math.random()), 3, 6);
			cubeTexture.uploadFromBitmapData(new BitmapData(4, 4, false, 0xFFFFFFFF*Math.random()), 4, 6);
			cubeTexture.uploadFromBitmapData(new BitmapData(4, 4, false, 0xFFFFFFFF*Math.random()), 5, 6);			
			
			cubeTexture.uploadFromBitmapData(new BitmapData(2, 2, false, 0xFFFFFFFF*Math.random()), 0, 7);
			cubeTexture.uploadFromBitmapData(new BitmapData(2, 2, false, 0xFFFFFFFF*Math.random()), 1, 7);
			cubeTexture.uploadFromBitmapData(new BitmapData(2, 2, false, 0xFFFFFFFF*Math.random()), 2, 7);
			cubeTexture.uploadFromBitmapData(new BitmapData(2, 2, false, 0xFFFFFFFF*Math.random()), 3, 7);
			cubeTexture.uploadFromBitmapData(new BitmapData(2, 2, false, 0xFFFFFFFF*Math.random()), 4, 7);
			cubeTexture.uploadFromBitmapData(new BitmapData(2, 2, false, 0xFFFFFFFF*Math.random()), 5, 7);
			
			cubeTexture.uploadFromBitmapData(new BitmapData(1, 1, false, 0xFFFFFFFF*Math.random()), 0, 8);
			cubeTexture.uploadFromBitmapData(new BitmapData(1, 1, false, 0xFFFFFFFF*Math.random()), 1, 8);
			cubeTexture.uploadFromBitmapData(new BitmapData(1, 1, false, 0xFFFFFFFF*Math.random()), 2, 8);
			cubeTexture.uploadFromBitmapData(new BitmapData(1, 1, false, 0xFFFFFFFF*Math.random()), 3, 8);
			cubeTexture.uploadFromBitmapData(new BitmapData(1, 1, false, 0xFFFFFFFF*Math.random()), 4, 8);
			cubeTexture.uploadFromBitmapData(new BitmapData(1, 1, false, 0xFFFFFFFF*Math.random()), 5, 8);
			
			program.upload(vertexAssembler.agalcode,fragmAssembler.agalcode);
			
			
			context3D.setVertexBufferAt(0,vertexBuffer,0,Context3DVertexBufferFormat.FLOAT_3);
			context3D.setVertexBufferAt(1,vertexBuffer,3,Context3DVertexBufferFormat.FLOAT_3);	
			context3D.setTextureAt(0,cubeTexture);
			
			var pm:PerspectiveMatrix3D=new PerspectiveMatrix3D();
			pm.perspectiveFieldOfViewLH(0.7, 4/3,0.1, 100);
			context3D.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,4,pm,true);
			unitMatrix=new Matrix3D();
			unitMatrix.prependTranslation(0, 0,15);
			//unitMatrix.appendScale(0.5,0.5,0.5);
			context3D.setCulling(Context3DTriangleFace.BACK);
			
			context3D.setProgram(program);
			addEventListener(Event.ENTER_FRAME,render);
		}
		/**
		 * 
		 * @param e
		 * 
		 */
		private function render(e:Event):void
		{
			
			context3D.clear(0,0,0,1);
			unitMatrix.appendRotation(3,new Vector3D(0,1,0),new Vector3D(0,0,17));
			
			context3D.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,124,unitMatrix,true);
			
			context3D.drawTriangles(indexBuffer,0,-1);
			context3D.present();
		}
	}

}