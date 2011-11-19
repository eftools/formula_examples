package 
{
	import flash.display.Bitmap;
	import inobr.eft.common.ui.*;
	import inobr.eft.formula.core.*;
	import inobr.eft.formula.core.checkers.*;
	import inobr.eft.formula.elements.functions.*;
	import inobr.eft.formula.elements.main.*;
	import inobr.eft.formula.lang.en;
	
	
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
			// add formulation of the task
			var formulation:Bitmap = new Formulation();
			addChild(formulation);
			
			// set the parameters of the formula workspace (size, language, position)
			var monomials:FormulaWorkspace = new FormulaWorkspace(480, 160, en);
			monomials.y = 55;
			
			// form toolbar
			monomials.toolbar.addCategoryByParams(new FractionCategoryButton(), [Power, Brackets]);
			monomials.toolbar.addCategoryByParams(new VariableCategoryButton(), [Variable.getToolbarItem("a", [-3, 1, 3]), Variable.getToolbarItem("b", [-3, 1, 3]), Variable.getToolbarItem("x", [-3, 1, 3]), Variable.getToolbarItem("y", [-3, 1, 3])]);

			// setup answer checking
			monomials.formulaAreaType = FormulaAreaTypes.CHECK;
			monomials.addChecker(new CheckByValues([-47829690, 30, 47829690]));
			monomials.addChecker(new CheckByNumericTokens(30, 5, 2));
			
			// visualize workspace
			addChild(monomials);
		}
		
	}

}