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

    [HttpPost("Login")]
    public async Task<ActionResult<User>> Login([FromBody] User user)
    {
        var existingUser = await _oscarPartyService.Login(user);

        return Ok(existingUser);
    }

    [HttpPost("Signup")]
    public async Task<ActionResult<User>> Signup([FromBody] User user)
    {
        var newUser = await _oscarPartyService.SaveNewUser(user);

        return Ok(newUser);
    }

    [HttpGet("GetCategories")]
    public async Task<ActionResult<List<Category>>> GetCategories()
    {
        var categories = await _oscarPartyService.GetAllCategories();

        return Ok(categories);
    }

    [HttpPut("SubmitPicks")]
    public async Task<IActionResult> SubmitPicks(List<UserPick> picks)
    {
        await _oscarPartyService.SubmitPicks(picks);

        return Ok();
    }
}