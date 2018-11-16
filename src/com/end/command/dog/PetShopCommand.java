package com.end.command.dog;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface PetShopCommand {
	public String exec(HttpServletRequest request, HttpServletResponse response);
}
