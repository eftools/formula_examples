package 
{
	import flash.display.Bitmap;
	import inobr.eft.common.ui.*;
	import inobr.eft.formula.core.*;
	import inobr.eft.formula.core.checkers.*;
	import inobr.eft.formula.elements.functions.*;
	import inobr.eft.formula.elements.main.*;
	import inobr.eft.formula.lang.ru;
	
	
	/**
	 * ...
	 * @author Peter Gerasimenko <gpstmp@gmail.com>
	 */
	[SWF(width = "500", height = "226", frameRate = "30", backgroundColor = "#2581C0")]	
	public class MultiplyMonomials extends Initializer 
	{
		[Embed(source="formulation.png")]
		private var Formulation:Class;
		
		override protected function initialize():void
		{
			// добавляем формулировку задачи
			var formulation:Bitmap = new Formulation();
			addChild(formulation);
			
			// настраиваем параметры рабочей области для ввод формул (размер, язык, положение)
			var monomials:FormulaWorkspace = new FormulaWorkspace(480, 160, ru);
			monomials.y = 55;

			// наполняем панель элементами, которые будут использоваться для ввода
			monomials.toolbar.addCategoryByParams(new CommonCategoryButton(), [Power, Brackets]);
			monomials.toolbar.addCategoryByParams(new VariableCategoryButton(), [Variable.getToolbarItem("a", [-3, 1, 3]), Variable.getToolbarItem("b", [-3, 1, 3]), Variable.getToolbarItem("x", [-3, 1, 3]), Variable.getToolbarItem("y", [-3, 1, 3])]);
			
			// настраиваем проверку ответа
			monomials.formulaAreaType = FormulaAreaTypes.CHECK;
			monomials.addChecker(new CheckByValues([-47829690, 30, 47829690]));
			monomials.addChecker(new CheckByNumericTokens(30, 5, 2));
			
			// визуализируем рабочую область
			addChild(monomials);
		}
		
	}

}