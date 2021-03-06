package SuperMap.Web.Realspace
{
	import SuperMap.Web.Core.Feature3D;
	import SuperMap.Web.Core.Rectangle2D;
	import SuperMap.Web.Util.ClassBase;
	
	import flash.utils.getDefinitionByName;
	
	public class Layer3D extends ClassBase
	{
		public var CLASSNAME:String="Layer3D";
		private var REALSPACE_CLASSNAME:String="SuperMap.Web.Realspace.Layer3D";
		
		public function Layer3D(strServerRootUrl:Object=null, strLayerName:String=null, strDataName:String=null,layer3DType:Number=0)
		{
			var key:Number;
			var isNew:Boolean;
			var array:Object;
			if(strServerRootUrl is String)
			{
				key=0;
				isNew=true;
				var realArgument:Array=[
					strServerRootUrl.toString()+"$String",
					strLayerName.toString()+"$String",
					strDataName.toString()+"$String",
					layer3DType.toString()+"$Number"
				];
				array={
					className:this.REALSPACE_CLASSNAME,
						realArgument:realArgument
				};
			}
			else
			{
				key=strServerRootUrl["key"] as Number;
				isNew=strServerRootUrl["isNew"] as Boolean;
			}
			super(key,isNew,array);
		}
		/**
		 * 获取三维图层的图层名。图层的名称在图层所在的三维场景中唯一标识此图层。该标识不区分大小写。
		 */
		public function get_name():String
		{
			var array:Object={
				action:"FUNCTION",
				isNew:true,
				key:this.KEY,
					functionName:"get_name",
					isReturn:true
			};
			return this.flexToJsCall(array) as String;
		}
		/**
		 * 获取图层中指定ID的Feature3D对象。通过该方法可以将选择到的Feature3D对象查找出来，
		 * 并使用其名称、是否可见、可见高度三个属性信息。
		 */
		public function findFeature3DByID(id:Number):Feature3D
		{
			//var feature3DKey:Number=this.getSoleKey();
			var realArgument:Array=[id.toString()+"$Number"];;
			var array:Object={
				action:"FUNCTION",
				isNew:true,
				key:this.KEY,
					functionName:"findFeature3DByID",
					isReturn:true,
					realArgument:realArgument
			};
			return this.flexToJsCall(array) as Feature3D;
		}
		/**
		 * 获取图层的地理范围，默认值为全球范围{-180, 90, 180, -90}，单位为经纬度。
		 */
		public function get_bounds():Rectangle2D
		{
			var array:Object={
				action:"FUNCTION",
				isNew:true,
				key:this.KEY,
					functionName:"get_bounds",
					isReturn:true
			};
			return this.flexToJsCall(array) as Rectangle2D;
		}
	}
}