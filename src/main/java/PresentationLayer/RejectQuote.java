package PresentationLayer;

import FunctionLayer.LogicFacade;
import FunctionLayer.LoginSampleException;
import FunctionLayer.UserProposition;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

/**
 * RejectQuote will reject and delete a given customer quote
 */
public class RejectQuote extends Command {
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LoginSampleException, SQLException {
        HttpSession session = request.getSession();

        String quoteID = request.getParameter("quoteId");

        LogicFacade.deleteQuote(Integer.parseInt(quoteID));

        List<UserProposition> userProposition = LogicFacade.getAllUserPropositions();
        request.setAttribute("userpropositions", userProposition);

        return "adminpage";
    }
}