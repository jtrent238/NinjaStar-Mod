package com.jtrent238.ninjastarmod;

import com.jtrent238.ninjastarmod.items.ItemNinjaStar;
import com.jtrent238.ninjastarmod.items.ItemNinjaStar_diamond;
import com.jtrent238.ninjastarmod.items.ItemNinjaStar_gold;
import com.jtrent238.ninjastarmod.items.ItemNinjaStar_iron;
import com.jtrent238.ninjastarmod.items.ItemNinjaStar_stone;
import com.jtrent238.ninjastarmod.items.ItemNinjaStar_wood;

import cpw.mods.fml.common.registry.GameRegistry;
import net.minecraft.item.Item;

public class ItemLoader {

	public static Item ItemNinjaStar;
	public static Item ItemNinjaStar_wood;
	public static Item ItemNinjaStar_stone;
	public static Item ItemNinjaStar_iron;
	public static Item ItemNinjaStar_gold;
	public static Item ItemNinjaStar_diamond;


	/**
	 * Load Items.
	 */
public static void LoadItems() {
	//ItemNinjaStar  = new ItemNinjaStar(0, ItemNinjaStar, null, null, null).setUnlocalizedName("ItemNinjaStar").setTextureName("ninjastarmod:ItemNinjaStar").setCreativeTab(NinjaStarMod.NinjaStarTab).setHasSubtypes(true);
	ItemNinjaStar_wood  = new ItemNinjaStar_wood().setUnlocalizedName("ItemNinjaStar_wood").setTextureName("ninjastarmod:ItemNinjaStar_wood").setCreativeTab(NinjaStarMod.NinjaStarTab);
	ItemNinjaStar_stone  = new ItemNinjaStar_stone().setUnlocalizedName("ItemNinjaStar_stone").setTextureName("ninjastarmod:ItemNinjaStar_stone").setCreativeTab(NinjaStarMod.NinjaStarTab);
	ItemNinjaStar_iron  = new ItemNinjaStar_iron().setUnlocalizedName("ItemNinjaStar_iron").setTextureName("ninjastarmod:ItemNinjaStar_iron").setCreativeTab(NinjaStarMod.NinjaStarTab);
	ItemNinjaStar_gold  = new ItemNinjaStar_gold().setUnlocalizedName("ItemNinjaStar_gold").setTextureName("ninjastarmod:ItemNinjaStar_gold").setCreativeTab(NinjaStarMod.NinjaStarTab);
	ItemNinjaStar_diamond  = new ItemNinjaStar_diamond().setUnlocalizedName("ItemNinjaStar_diamond").setTextureName("ninjastarmod:ItemNinjaStar_diamond").setCreativeTab(NinjaStarMod.NinjaStarTab);
	

		registerItems();
}

/**
 * Register Items.
 */
private static void registerItems(){

	//GameRegistry.registerItem(ItemNinjaStar, ItemNinjaStar.getUnlocalizedName().substring(5));
	GameRegistry.registerItem(ItemNinjaStar_wood, ItemNinjaStar_wood.getUnlocalizedName().substring(5));
	GameRegistry.registerItem(ItemNinjaStar_stone, ItemNinjaStar_stone.getUnlocalizedName().substring(5));
	GameRegistry.registerItem(ItemNinjaStar_iron, ItemNinjaStar_iron.getUnlocalizedName().substring(5));
	GameRegistry.registerItem(ItemNinjaStar_gold, ItemNinjaStar_gold.getUnlocalizedName().substring(5));
	GameRegistry.registerItem(ItemNinjaStar_diamond, ItemNinjaStar_diamond.getUnlocalizedName().substring(5));
	
}

}