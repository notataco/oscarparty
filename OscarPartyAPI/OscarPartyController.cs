using Microsoft.AspNetCore.Mvc;
using OscarPartyAPI._models;
using OscarPartyAPI.Repositories;
using OscarPartyAPI.Services;

[Route("api/[controller]")]
[ApiController]
public class OscarPartyController : ControllerBase
{
    private readonly IOscarPartyService _oscarPartyService;

    public OscarPartyController(IOscarPartyService oscarPartyService)
    {
        _oscarPartyService = oscarPartyService;
    }

    [HttpGet("GetAllUsers")]
    public async Task<ActionResult<List<User>>> GetAllUsers()
    {
        var users = await _oscarPartyService.GetAllUsers();

        return Ok(users);
    }

    [HttpPost("SaveNewUser")]
    public async Task<ActionResult> SaveNewUser([FromBody] User user)
    {
        await _oscarPartyService.SaveNewUser(user);

        return Ok();
    }

    [HttpGet("GetCategories")]
    public async Task<ActionResult<List<Category>>> GetCategories()
    {
        var categories = await _oscarPartyService.GetAllCategories();

        return Ok(categories);
    }
}