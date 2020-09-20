package com.kh.springFinal;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class Test01 {
	
	@Autowired
	private WebApplicationContext context;
	
	private MockMvc mock;
	private MockHttpSession session;
	
	@Before
	public void before() {
		mock = MockMvcBuilders.webAppContextSetup(context).build();
		session = new MockHttpSession();
	}
	
	@Test
	public void test() throws Exception{
		mock.perform(
				get("/professor/detail").param("profe_no", "39").session(session)
			)
			.andDo(print())
			.andExpect(status().is2xxSuccessful())
			.andReturn();
	}
	
}
