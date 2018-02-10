package com.jtrent238.ninjastarmod;


import cpw.mods.fml.common.registry.GameRegistry;
import cpw.mods.fml.common.registry.GameRegistry.Type;
import net.minecraft.block.Block;
import net.minecraft.entity.monster.EntityPigZombie;
import net.minecraft.init.Blocks;
import net.minecraft.init.Items;
import net.minecraft.item.Item;
import net.minecraft.item.ItemPotion;
import net.minecraft.item.ItemStack;
import net.minecraft.potion.Potion;



public class Recipes {

	
	/**
	 * Register Recipes with Game Registry.
	 */
	public static void registerRecpies(){
		addShaplessRecpies();
		addShapedRecpies();
	}

	/**
	 * Add Shaped Recipes.
	 */
	private static void addShapedRecpies(){
		GameRegistry.addShapedRecipe(new ItemStack(ItemLoader.ItemNinjaStar_wood, 32), "BIB", "III","BIB", 'I', Blocks.planks);
		GameRegistry.addShapedRecipe(new ItemStack(ItemLoader.ItemNinjaStar_stone, 32), "BIB", "III","BIB", 'I', Blocks.cobblestone);
		GameRegistry.addShapedRecipe(new ItemStack(ItemLoader.ItemNinjaStar_iron, 32), "BIB", "III","BIB", 'I', Items.iron_ingot);
		GameRegistry.addShapedRecipe(new ItemStack(ItemLoader.ItemNinjaStar_gold, 32), "BIB", "III","BIB", 'I', Items.gold_ingot);
		GameRegistry.addShapedRecipe(new ItemStack(ItemLoader.ItemNinjaStar_diamond, 32), "BIB", "III","BIB", 'I', Items.diamond);
		}
	
	/**
	 * Add Shapeless Recipes.
	 */
	private static void addShaplessRecpies(){
		
		}
	
	}

	
	
	